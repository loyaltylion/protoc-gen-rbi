# Code generated by protoc-gen-rbi. DO NOT EDIT.
# source: subdir/messages.proto
# typed: strict

class Testdata::Subdir::IntegerMessage
  include ::Google::Protobuf
  include ::Google::Protobuf::MessageExts
  extend ::Google::Protobuf::MessageExts::ClassMethods

  sig { params(str: String).returns(Testdata::Subdir::IntegerMessage) }
  def self.decode(str)
  end

  sig { params(msg: Testdata::Subdir::IntegerMessage).returns(String) }
  def self.encode(msg)
  end

  sig { params(str: String, kw: T.untyped).returns(Testdata::Subdir::IntegerMessage) }
  def self.decode_json(str, **kw)
  end

  sig { params(msg: Testdata::Subdir::IntegerMessage, kw: T.untyped).returns(String) }
  def self.encode_json(msg, **kw)
  end

  sig { returns(::Google::Protobuf::Descriptor) }
  def self.descriptor
  end

  sig do
    params(
      value: T.nilable(Integer)
    ).void
  end
  def initialize(
    value: 0
  )
  end

  sig { returns(Integer) }
  def value
  end

  sig { params(value: Integer).void }
  def value=(value)
  end

  sig { void }
  def clear_value
  end

  sig { params(field: String).returns(T.untyped) }
  def [](field)
  end

  sig { params(field: String, value: T.untyped).void }
  def []=(field, value)
  end

  sig { returns(T::Hash[Symbol, T.untyped]) }
  def to_h
  end
end

class Testdata::Subdir::Empty
  include ::Google::Protobuf
  include ::Google::Protobuf::MessageExts
  extend ::Google::Protobuf::MessageExts::ClassMethods

  sig { params(str: String).returns(Testdata::Subdir::Empty) }
  def self.decode(str)
  end

  sig { params(msg: Testdata::Subdir::Empty).returns(String) }
  def self.encode(msg)
  end

  sig { params(str: String, kw: T.untyped).returns(Testdata::Subdir::Empty) }
  def self.decode_json(str, **kw)
  end

  sig { params(msg: Testdata::Subdir::Empty, kw: T.untyped).returns(String) }
  def self.encode_json(msg, **kw)
  end

  sig { returns(::Google::Protobuf::Descriptor) }
  def self.descriptor
  end

  sig {void}
  def initialize; end

  sig { params(field: String).returns(T.untyped) }
  def [](field)
  end

  sig { params(field: String, value: T.untyped).void }
  def []=(field, value)
  end

  sig { returns(T::Hash[Symbol, T.untyped]) }
  def to_h
  end
end

class Testdata::Subdir::AllTypes
  include ::Google::Protobuf
  include ::Google::Protobuf::MessageExts
  extend ::Google::Protobuf::MessageExts::ClassMethods

  sig { params(str: String).returns(Testdata::Subdir::AllTypes) }
  def self.decode(str)
  end

  sig { params(msg: Testdata::Subdir::AllTypes).returns(String) }
  def self.encode(msg)
  end

  sig { params(str: String, kw: T.untyped).returns(Testdata::Subdir::AllTypes) }
  def self.decode_json(str, **kw)
  end

  sig { params(msg: Testdata::Subdir::AllTypes, kw: T.untyped).returns(String) }
  def self.encode_json(msg, **kw)
  end

  sig { returns(::Google::Protobuf::Descriptor) }
  def self.descriptor
  end

  sig do
    params(
      double_value: T.nilable(Float),
      float_value: T.nilable(Float),
      int32_value: T.nilable(Integer),
      int64_value: T.nilable(Integer),
      uint32_value: T.nilable(Integer),
      uint64_value: T.nilable(Integer),
      sint32_value: T.nilable(Integer),
      sint64_value: T.nilable(Integer),
      fixed32_value: T.nilable(Integer),
      fixed64_value: T.nilable(Integer),
      sfixed32_value: T.nilable(Integer),
      sfixed64_value: T.nilable(Integer),
      bool_value: T.nilable(T::Boolean),
      string_value: T.nilable(String),
      bytes_value: T.nilable(String),
      enum_value: T.nilable(T.any(Symbol, String, Integer)),
      alias_enum_value: T.nilable(T.any(Symbol, String, Integer)),
      nested_value: T.nilable(Testdata::Subdir::IntegerMessage),
      repeated_nested_value: T.nilable(T.any(T::Array[T.nilable(Testdata::Subdir::IntegerMessage)], ::Google::Protobuf::RepeatedField[T.nilable(Testdata::Subdir::IntegerMessage)])),
      repeated_int32_value: T.nilable(T.any(T::Array[Integer], ::Google::Protobuf::RepeatedField[Integer])),
      repeated_enum: T.nilable(T.any(T::Array[T.any(Symbol, String, Integer)], ::Google::Protobuf::RepeatedField[T.any(Symbol, String, Integer)])),
      inner_value: T.nilable(Testdata::Subdir::AllTypes::InnerMessage),
      inner_nested_value: T.nilable(Testdata::Subdir::IntegerMessage::InnerNestedMessage),
      name: T.nilable(String),
      sub_message: T.nilable(T::Boolean),
      string_map_value: T.nilable(T::Hash[String, T.nilable(Testdata::Subdir::IntegerMessage)]),
      int32_map_value: T.nilable(T::Hash[Integer, T.nilable(Testdata::Subdir::IntegerMessage)]),
      enum_map_value: T.nilable(T::Hash[String, T.any(Symbol, String, Integer)]),
      optional_bool: T.nilable(T::Boolean)
    ).void
  end
  def initialize(
    double_value: 0.0,
    float_value: 0.0,
    int32_value: 0,
    int64_value: 0,
    uint32_value: 0,
    uint64_value: 0,
    sint32_value: 0,
    sint64_value: 0,
    fixed32_value: 0,
    fixed64_value: 0,
    sfixed32_value: 0,
    sfixed64_value: 0,
    bool_value: false,
    string_value: "",
    bytes_value: "",
    enum_value: :UNIVERSAL,
    alias_enum_value: :UNKNOWN,
    nested_value: nil,
    repeated_nested_value: [],
    repeated_int32_value: [],
    repeated_enum: [],
    inner_value: nil,
    inner_nested_value: nil,
    name: "",
    sub_message: false,
    string_map_value: ::Google::Protobuf::Map.new(:string, :message, Testdata::Subdir::IntegerMessage),
    int32_map_value: ::Google::Protobuf::Map.new(:int32, :message, Testdata::Subdir::IntegerMessage),
    enum_map_value: ::Google::Protobuf::Map.new(:string, :enum),
    optional_bool: false
  )
  end

  sig { returns(Float) }
  def double_value
  end

  sig { params(value: Float).void }
  def double_value=(value)
  end

  sig { void }
  def clear_double_value
  end

  sig { returns(Float) }
  def float_value
  end

  sig { params(value: Float).void }
  def float_value=(value)
  end

  sig { void }
  def clear_float_value
  end

  sig { returns(Integer) }
  def int32_value
  end

  sig { params(value: Integer).void }
  def int32_value=(value)
  end

  sig { void }
  def clear_int32_value
  end

  sig { returns(Integer) }
  def int64_value
  end

  sig { params(value: Integer).void }
  def int64_value=(value)
  end

  sig { void }
  def clear_int64_value
  end

  sig { returns(Integer) }
  def uint32_value
  end

  sig { params(value: Integer).void }
  def uint32_value=(value)
  end

  sig { void }
  def clear_uint32_value
  end

  sig { returns(Integer) }
  def uint64_value
  end

  sig { params(value: Integer).void }
  def uint64_value=(value)
  end

  sig { void }
  def clear_uint64_value
  end

  sig { returns(Integer) }
  def sint32_value
  end

  sig { params(value: Integer).void }
  def sint32_value=(value)
  end

  sig { void }
  def clear_sint32_value
  end

  sig { returns(Integer) }
  def sint64_value
  end

  sig { params(value: Integer).void }
  def sint64_value=(value)
  end

  sig { void }
  def clear_sint64_value
  end

  sig { returns(Integer) }
  def fixed32_value
  end

  sig { params(value: Integer).void }
  def fixed32_value=(value)
  end

  sig { void }
  def clear_fixed32_value
  end

  sig { returns(Integer) }
  def fixed64_value
  end

  sig { params(value: Integer).void }
  def fixed64_value=(value)
  end

  sig { void }
  def clear_fixed64_value
  end

  sig { returns(Integer) }
  def sfixed32_value
  end

  sig { params(value: Integer).void }
  def sfixed32_value=(value)
  end

  sig { void }
  def clear_sfixed32_value
  end

  sig { returns(Integer) }
  def sfixed64_value
  end

  sig { params(value: Integer).void }
  def sfixed64_value=(value)
  end

  sig { void }
  def clear_sfixed64_value
  end

  sig { returns(T::Boolean) }
  def bool_value
  end

  sig { params(value: T::Boolean).void }
  def bool_value=(value)
  end

  sig { void }
  def clear_bool_value
  end

  sig { returns(String) }
  def string_value
  end

  sig { params(value: String).void }
  def string_value=(value)
  end

  sig { void }
  def clear_string_value
  end

  sig { returns(String) }
  def bytes_value
  end

  sig { params(value: String).void }
  def bytes_value=(value)
  end

  sig { void }
  def clear_bytes_value
  end

  sig { returns(Symbol) }
  def enum_value
  end

  sig { params(value: T.any(Symbol, String, Integer)).void }
  def enum_value=(value)
  end

  sig { void }
  def clear_enum_value
  end

  sig { returns(Symbol) }
  def alias_enum_value
  end

  sig { params(value: T.any(Symbol, String, Integer)).void }
  def alias_enum_value=(value)
  end

  sig { void }
  def clear_alias_enum_value
  end

  sig { returns(T.nilable(Testdata::Subdir::IntegerMessage)) }
  def nested_value
  end

  sig { params(value: T.nilable(Testdata::Subdir::IntegerMessage)).void }
  def nested_value=(value)
  end

  sig { void }
  def clear_nested_value
  end

  sig { returns(T.any(T::Array[T.nilable(Testdata::Subdir::IntegerMessage)], ::Google::Protobuf::RepeatedField[T.nilable(Testdata::Subdir::IntegerMessage)])) }
  def repeated_nested_value
  end

  sig { params(value: ::Google::Protobuf::RepeatedField[T.nilable(Testdata::Subdir::IntegerMessage)]).void }
  def repeated_nested_value=(value)
  end

  sig { void }
  def clear_repeated_nested_value
  end

  sig { returns(T.any(T::Array[Integer], ::Google::Protobuf::RepeatedField[Integer])) }
  def repeated_int32_value
  end

  sig { params(value: ::Google::Protobuf::RepeatedField[Integer]).void }
  def repeated_int32_value=(value)
  end

  sig { void }
  def clear_repeated_int32_value
  end

  sig { returns(T.any(T::Array[Symbol], ::Google::Protobuf::RepeatedField[Symbol])) }
  def repeated_enum
  end

  sig { params(value: ::Google::Protobuf::RepeatedField[T.any(Symbol, String, Integer)]).void }
  def repeated_enum=(value)
  end

  sig { void }
  def clear_repeated_enum
  end

  sig { returns(T.nilable(Testdata::Subdir::AllTypes::InnerMessage)) }
  def inner_value
  end

  sig { params(value: T.nilable(Testdata::Subdir::AllTypes::InnerMessage)).void }
  def inner_value=(value)
  end

  sig { void }
  def clear_inner_value
  end

  sig { returns(T.nilable(Testdata::Subdir::IntegerMessage::InnerNestedMessage)) }
  def inner_nested_value
  end

  sig { params(value: T.nilable(Testdata::Subdir::IntegerMessage::InnerNestedMessage)).void }
  def inner_nested_value=(value)
  end

  sig { void }
  def clear_inner_nested_value
  end

  sig { returns(String) }
  def name
  end

  sig { params(value: String).void }
  def name=(value)
  end

  sig { void }
  def clear_name
  end

  sig { returns(T::Boolean) }
  def sub_message
  end

  sig { params(value: T::Boolean).void }
  def sub_message=(value)
  end

  sig { void }
  def clear_sub_message
  end

  sig { returns(T::Hash[String, T.nilable(Testdata::Subdir::IntegerMessage)]) }
  def string_map_value
  end

  sig { params(value: ::Google::Protobuf::Map).void }
  def string_map_value=(value)
  end

  sig { void }
  def clear_string_map_value
  end

  sig { returns(T::Hash[Integer, T.nilable(Testdata::Subdir::IntegerMessage)]) }
  def int32_map_value
  end

  sig { params(value: ::Google::Protobuf::Map).void }
  def int32_map_value=(value)
  end

  sig { void }
  def clear_int32_map_value
  end

  sig { returns(T::Hash[String, Symbol]) }
  def enum_map_value
  end

  sig { params(value: ::Google::Protobuf::Map).void }
  def enum_map_value=(value)
  end

  sig { void }
  def clear_enum_map_value
  end

  sig { returns(T::Boolean) }
  def optional_bool
  end

  sig { params(value: T::Boolean).void }
  def optional_bool=(value)
  end

  sig { void }
  def clear_optional_bool
  end

  sig { returns(T::Boolean) }
  def has_optional_bool?
  end

  sig { returns(T.nilable(Symbol)) }
  def test_oneof
  end

  sig { params(field: String).returns(T.untyped) }
  def [](field)
  end

  sig { params(field: String, value: T.untyped).void }
  def []=(field, value)
  end

  sig { returns(T::Hash[Symbol, T.untyped]) }
  def to_h
  end
end

class Testdata::Subdir::IntegerMessage::InnerNestedMessage
  include ::Google::Protobuf
  include ::Google::Protobuf::MessageExts
  extend ::Google::Protobuf::MessageExts::ClassMethods

  sig { params(str: String).returns(Testdata::Subdir::IntegerMessage::InnerNestedMessage) }
  def self.decode(str)
  end

  sig { params(msg: Testdata::Subdir::IntegerMessage::InnerNestedMessage).returns(String) }
  def self.encode(msg)
  end

  sig { params(str: String, kw: T.untyped).returns(Testdata::Subdir::IntegerMessage::InnerNestedMessage) }
  def self.decode_json(str, **kw)
  end

  sig { params(msg: Testdata::Subdir::IntegerMessage::InnerNestedMessage, kw: T.untyped).returns(String) }
  def self.encode_json(msg, **kw)
  end

  sig { returns(::Google::Protobuf::Descriptor) }
  def self.descriptor
  end

  sig do
    params(
      value: T.nilable(Float)
    ).void
  end
  def initialize(
    value: 0.0
  )
  end

  sig { returns(Float) }
  def value
  end

  sig { params(value: Float).void }
  def value=(value)
  end

  sig { void }
  def clear_value
  end

  sig { params(field: String).returns(T.untyped) }
  def [](field)
  end

  sig { params(field: String, value: T.untyped).void }
  def []=(field, value)
  end

  sig { returns(T::Hash[Symbol, T.untyped]) }
  def to_h
  end
end

class Testdata::Subdir::IntegerMessage::NestedEmpty
  include ::Google::Protobuf
  include ::Google::Protobuf::MessageExts
  extend ::Google::Protobuf::MessageExts::ClassMethods

  sig { params(str: String).returns(Testdata::Subdir::IntegerMessage::NestedEmpty) }
  def self.decode(str)
  end

  sig { params(msg: Testdata::Subdir::IntegerMessage::NestedEmpty).returns(String) }
  def self.encode(msg)
  end

  sig { params(str: String, kw: T.untyped).returns(Testdata::Subdir::IntegerMessage::NestedEmpty) }
  def self.decode_json(str, **kw)
  end

  sig { params(msg: Testdata::Subdir::IntegerMessage::NestedEmpty, kw: T.untyped).returns(String) }
  def self.encode_json(msg, **kw)
  end

  sig { returns(::Google::Protobuf::Descriptor) }
  def self.descriptor
  end

  sig {void}
  def initialize; end

  sig { params(field: String).returns(T.untyped) }
  def [](field)
  end

  sig { params(field: String, value: T.untyped).void }
  def []=(field, value)
  end

  sig { returns(T::Hash[Symbol, T.untyped]) }
  def to_h
  end
end

class Testdata::Subdir::AllTypes::InnerMessage
  include ::Google::Protobuf
  include ::Google::Protobuf::MessageExts
  extend ::Google::Protobuf::MessageExts::ClassMethods

  sig { params(str: String).returns(Testdata::Subdir::AllTypes::InnerMessage) }
  def self.decode(str)
  end

  sig { params(msg: Testdata::Subdir::AllTypes::InnerMessage).returns(String) }
  def self.encode(msg)
  end

  sig { params(str: String, kw: T.untyped).returns(Testdata::Subdir::AllTypes::InnerMessage) }
  def self.decode_json(str, **kw)
  end

  sig { params(msg: Testdata::Subdir::AllTypes::InnerMessage, kw: T.untyped).returns(String) }
  def self.encode_json(msg, **kw)
  end

  sig { returns(::Google::Protobuf::Descriptor) }
  def self.descriptor
  end

  sig do
    params(
      value: T.nilable(String)
    ).void
  end
  def initialize(
    value: ""
  )
  end

  sig { returns(String) }
  def value
  end

  sig { params(value: String).void }
  def value=(value)
  end

  sig { void }
  def clear_value
  end

  sig { params(field: String).returns(T.untyped) }
  def [](field)
  end

  sig { params(field: String, value: T.untyped).void }
  def []=(field, value)
  end

  sig { returns(T::Hash[Symbol, T.untyped]) }
  def to_h
  end
end

module Testdata::Subdir::AllTypes::Corpus
  self::UNIVERSAL = T.let(0, Integer)
  self::WEB = T.let(1, Integer)
  self::IMAGES = T.let(2, Integer)
  self::LOCAL = T.let(3, Integer)
  self::NEWS = T.let(4, Integer)
  self::PRODUCTS = T.let(5, Integer)
  self::VIDEO = T.let(6, Integer)
  self::END = T.let(7, Integer)

  sig { params(value: Integer).returns(T.nilable(Symbol)) }
  def self.lookup(value)
  end

  sig { params(value: Symbol).returns(T.nilable(Integer)) }
  def self.resolve(value)
  end

  sig { returns(::Google::Protobuf::EnumDescriptor) }
  def self.descriptor
  end
end

module Testdata::Subdir::AllTypes::EnumAllowingAlias
  self::UNKNOWN = T.let(0, Integer)
  self::STARTED = T.let(1, Integer)
  self::RUNNING = T.let(1, Integer)

  sig { params(value: Integer).returns(T.nilable(Symbol)) }
  def self.lookup(value)
  end

  sig { params(value: Symbol).returns(T.nilable(Integer)) }
  def self.resolve(value)
  end

  sig { returns(::Google::Protobuf::EnumDescriptor) }
  def self.descriptor
  end
end
