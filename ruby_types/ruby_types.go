package ruby_types

import (
	"fmt"
	"log"
	"strings"

	pgs "github.com/lyft/protoc-gen-star"
)

type methodType int

const (
	methodTypeGetter methodType = iota
	methodTypeSetter
	methodTypeInitializer
)

// intersection between pgs.FieldType and pgs.FieldTypeElem
type FieldType interface {
	ProtoType() pgs.ProtoType
	IsEmbed() bool
	IsEnum() bool
	Imports() []pgs.File
	Enum() pgs.Enum
	Embed() pgs.Message
}

// intersection between pgs.Message and pgs.Enum
type EntityWithParent interface {
	pgs.Entity
	Parent() pgs.ParentEntity
}

func RubyPackage(file pgs.File) string {
	pkg := file.Descriptor().GetOptions().GetRubyPackage()
	if pkg == "" {
		pkg = file.Descriptor().GetPackage()
	}
	pkg = strings.Replace(pkg, ".", "::", -1)
	// right now the ruby_out doesn't camelcase the ruby_package, but this results in invalid classes, so do it:
	return upperCamelCase(pkg)
}

// Sort fields for use in an initializer. This will place optional fields at
// the end, which is required by Ruby
func RubySortFieldsForInitializer(fields []pgs.Field) []pgs.Field {
	required_fields := make([]pgs.Field, 0)
	optional_fields := make([]pgs.Field, 0)

	for _, field := range fields {
		if field.Descriptor().GetProto3Optional() || field.InRealOneOf() {
			optional_fields = append(optional_fields, field)
		} else {
			required_fields = append(required_fields, field)
		}
	}

	return append(required_fields, optional_fields...)
}

func RubyMessageType(entity EntityWithParent) string {
	names := make([]string, 0)
	outer := entity
	ok := true
	for ok {
		name := outer.Name().String()
		names = append([]string{strings.Title(name)}, names...)
		outer, ok = outer.Parent().(pgs.Message)
	}
	return fmt.Sprintf("%s::%s", RubyPackage(entity.File()), strings.Join(names, "::"))
}

func RubyGetterFieldType(field pgs.Field) string {
	return rubyFieldType(field, methodTypeGetter)
}

func RubySetterFieldType(field pgs.Field) string {
	return rubyFieldType(field, methodTypeSetter)
}

func RubyInitializerFieldType(field pgs.Field) string {
	return rubyFieldType(field, methodTypeInitializer)
}

func rubyFieldType(field pgs.Field, mt methodType) string {
	var rubyType string

	t := field.Type()

	if t.IsMap() {
		rubyType = rubyFieldMapType(field, t, mt)
	} else if t.IsRepeated() {
		rubyType = rubyFieldRepeatedType(field, t, mt)
	} else {
		rubyType = rubyProtoTypeElem(field, t, mt)
	}

	inOneOf := t.Field().InRealOneOf()
	isOptionalInitializer := mt == methodTypeInitializer && t.Field().Descriptor().GetProto3Optional()

	// optional initializers can always be nilable
	//
	// members of a oneOf should always be nil; there's no way to enforce passing
	// one of them with the way that the Ruby code generation currently works,
	// though it would be nice if there were and then we could pass it as a
	// non-nilable field with a `T.any` type
	if (inOneOf || isOptionalInitializer) &&
		(t.IsMap() || t.IsRepeated() || t.ProtoType() != pgs.MessageT) {
		return fmt.Sprintf("T.nilable(%s)", rubyType)
	}

	return rubyType
}

func rubyFieldMapType(field pgs.Field, ft pgs.FieldType, mt methodType) string {
	key := rubyProtoTypeElem(field, ft.Key(), mt)
	value := rubyProtoTypeElem(field, ft.Element(), mt)

	if mt == methodTypeSetter {
		return fmt.Sprintf("::Google::Protobuf::Map[%s, %s]", key, value)
	}

	// not confident this always returns a `Protobuf::Map`, so to be safe we'll
	// return a union. Both types have a `to_h` method that will return a typed
	// Hash
	return fmt.Sprintf("T.any(T::Hash[%s, %s], ::Google::Protobuf::Map[%s, %s])", key, value, key, value)
}

func rubyFieldRepeatedType(field pgs.Field, ft pgs.FieldType, mt methodType) string {
	value := rubyProtoTypeElem(field, ft.Element(), mt)

	// An enumerable/array is not accepted at the setter
	// See: https://github.com/protocolbuffers/protobuf/issues/4969
	// See: https://developers.google.com/protocol-buffers/docs/reference/ruby-generated#repeated-fields
	if mt == methodTypeSetter {
		return fmt.Sprintf("::Google::Protobuf::RepeatedField[%s]", value)
	}

	// not confident if this always returns a `RepeatedField`, so to be safe
	// we'll return a union. Both types have a `to_a` method that will return
	// a typed array, so it's easy to just call that as needed
	return fmt.Sprintf("T.any(T::Array[%s], ::Google::Protobuf::RepeatedField[%s])", value, value)
}

func RubyFieldValue(field pgs.Field) string {
	if !field.Descriptor().GetProto3Optional() && !field.InRealOneOf() {
		return ""
	}

	t := field.Type()
	if t.IsMap() {
		key := rubyMapType(t.Key())
		if t.Element().ProtoType() == pgs.MessageT {
			value := RubyMessageType(t.Element().Embed())
			return fmt.Sprintf("::Google::Protobuf::Map.new(%s, :message, %s)", key, value)
		}
		value := rubyMapType(t.Element())
		return fmt.Sprintf("::Google::Protobuf::Map.new(%s, %s)", key, value)
	} else if t.IsRepeated() {
		return "[]"
	}
	return rubyProtoTypeValue(field, t)
}

func rubyProtoTypeElem(field pgs.Field, ft FieldType, mt methodType) string {
	pt := ft.ProtoType()
	if pt.IsInt() {
		return "Integer"
	}
	if pt.IsNumeric() {
		return "Float"
	}
	if pt == pgs.StringT || pt == pgs.BytesT {
		return "String"
	}
	if pt == pgs.BoolT {
		return "T::Boolean"
	}
	if pt == pgs.EnumT {
		if mt == methodTypeGetter {
			return "Symbol"
		}
		return "T.any(Symbol, String, Integer)"
	}
	if pt == pgs.MessageT {
		ruby_type := RubyMessageType(ft.Embed())

		if mt != methodTypeInitializer || field.Descriptor().GetProto3Optional() || field.InRealOneOf() {
			return fmt.Sprintf("T.nilable(%s)", ruby_type)
		} else {
			return ruby_type
		}
	}
	log.Panicf("Unsupported field type for field: %v\n", field.Name().String())
	return ""
}

func rubyProtoTypeValue(field pgs.Field, ft FieldType) string {
	pt := ft.ProtoType()
	if pt.IsInt() {
		return "0"
	}
	if pt.IsNumeric() {
		return "0.0"
	}
	if pt == pgs.StringT || pt == pgs.BytesT {
		return "\"\""
	}
	if pt == pgs.BoolT {
		return "false"
	}
	if pt == pgs.EnumT {
		return fmt.Sprintf(":%s", ft.Enum().Values()[0].Name().String())
	}
	if pt == pgs.MessageT {
		return "nil"
	}
	log.Panicf("Unsupported field type for field: %v\n", field.Name().String())
	return ""
}

func rubyMapType(ft FieldType) string {
	switch ft.ProtoType() {
	case pgs.DoubleT:
		return ":double"
	case pgs.FloatT:
		return ":float"
	case pgs.Int64T:
		return ":int64"
	case pgs.UInt64T:
		return ":uint64"
	case pgs.Int32T:
		return ":int32"
	case pgs.Fixed64T:
		return ":fixed64"
	case pgs.Fixed32T:
		return ":fixed32"
	case pgs.BoolT:
		return ":bool"
	case pgs.StringT:
		return ":string"
	case pgs.BytesT:
		return ":bytes"
	case pgs.UInt32T:
		return ":uint32"
	case pgs.EnumT:
		return ":enum"
	case pgs.SFixed32:
		return ":sfixed32"
	case pgs.SFixed64:
		return ":sfixed64"
	case pgs.SInt32:
		return ":sint32"
	case pgs.SInt64:
		return ":sint64"
	}
	log.Panicf("Unsupported map field type\n")
	return ""
}

func RubyMethodParamType(method pgs.Method) string {
	return rubyMethodType(method.Input(), method.ClientStreaming())
}

func RubyMethodParamFields(method pgs.Method) []pgs.Field {
	return RubySortFieldsForInitializer(method.Input().Fields())
}

func RubyMethodReturnType(method pgs.Method) string {
	return rubyMethodType(method.Output(), method.ServerStreaming())
}

func RubyComment(source pgs.SourceCodeInfo) string {
	comments := strings.TrimSpace(source.LeadingComments())

	if len(comments) == 0 {
		return ""
	}

	ruby_comments := make([]string, 0)

	for _, line := range strings.Split(comments, "\n") {
		line = strings.TrimSpace(line)
		comment_line := "#"

		if len(line) != 0 {
			comment_line = comment_line + " " + line
		}

		ruby_comments = append(ruby_comments, comment_line)
	}

	return strings.Join(ruby_comments, "\n")
}

func rubyMethodType(message pgs.Message, streaming bool) string {
	t := RubyMessageType(message)
	if streaming {
		return fmt.Sprintf("T::Enumerable[%s]", t)
	}
	return t
}
