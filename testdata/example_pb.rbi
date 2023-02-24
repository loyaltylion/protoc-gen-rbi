# Code generated by protoc-gen-rbi. DO NOT EDIT.
# source: example.proto
# typed: strict

class Example::Request
  include ::Google::Protobuf
  include ::Google::Protobuf::MessageExts
  extend ::Google::Protobuf::MessageExts::ClassMethods

  sig { params(str: String).returns(Example::Request) }
  def self.decode(str)
  end

  sig { params(msg: Example::Request).returns(String) }
  def self.encode(msg)
  end

  sig { params(str: String, kw: T.untyped).returns(Example::Request) }
  def self.decode_json(str, **kw)
  end

  sig { params(msg: Example::Request, kw: T.untyped).returns(String) }
  def self.encode_json(msg, **kw)
  end

  sig { returns(::Google::Protobuf::Descriptor) }
  def self.descriptor
  end

  sig do
    params(
      name: String,
      test_list: T.any(T::Array[String], ::Google::Protobuf::RepeatedField[String]),
      example: Example::Request::Example,
      count: T.nilable(Integer),
      optional_example: T.nilable(Example::Request::Example)
    ).void
  end
  def initialize(
    name: ,
    test_list: ,
    example: ,
    count: 0,
    optional_example: nil
  )
  end

  # The name of the person who will be greeted
  sig { returns(String) }
  def name
  end

  # The name of the person who will be greeted
  sig { params(value: String).void }
  def name=(value)
  end

  sig { void }
  def clear_name
  end

  sig { returns(Integer) }
  def count
  end

  sig { params(value: Integer).void }
  def count=(value)
  end

  sig { void }
  def clear_count
  end

  sig { returns(T::Boolean) }
  def has_count?
  end

  sig { returns(T.any(T::Array[String], ::Google::Protobuf::RepeatedField[String])) }
  def test_list
  end

  sig { params(value: ::Google::Protobuf::RepeatedField[String]).void }
  def test_list=(value)
  end

  sig { void }
  def clear_test_list
  end

  sig { returns(T.nilable(Example::Request::Example)) }
  def example
  end

  sig { params(value: T.nilable(Example::Request::Example)).void }
  def example=(value)
  end

  sig { void }
  def clear_example
  end

  sig { returns(T.nilable(Example::Request::Example)) }
  def optional_example
  end

  sig { params(value: T.nilable(Example::Request::Example)).void }
  def optional_example=(value)
  end

  sig { void }
  def clear_optional_example
  end

  sig { returns(T::Boolean) }
  def has_optional_example?
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

class Example::Response
  include ::Google::Protobuf
  include ::Google::Protobuf::MessageExts
  extend ::Google::Protobuf::MessageExts::ClassMethods

  sig { params(str: String).returns(Example::Response) }
  def self.decode(str)
  end

  sig { params(msg: Example::Response).returns(String) }
  def self.encode(msg)
  end

  sig { params(str: String, kw: T.untyped).returns(Example::Response) }
  def self.decode_json(str, **kw)
  end

  sig { params(msg: Example::Response, kw: T.untyped).returns(String) }
  def self.encode_json(msg, **kw)
  end

  sig { returns(::Google::Protobuf::Descriptor) }
  def self.descriptor
  end

  sig do
    params(
      greeting: String
    ).void
  end
  def initialize(
    greeting: 
  )
  end

  # Greeting message, personalised for the individual's name
  sig { returns(String) }
  def greeting
  end

  # Greeting message, personalised for the individual's name
  sig { params(value: String).void }
  def greeting=(value)
  end

  sig { void }
  def clear_greeting
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

class Example::Request::Example
  include ::Google::Protobuf
  include ::Google::Protobuf::MessageExts
  extend ::Google::Protobuf::MessageExts::ClassMethods

  sig { params(str: String).returns(Example::Request::Example) }
  def self.decode(str)
  end

  sig { params(msg: Example::Request::Example).returns(String) }
  def self.encode(msg)
  end

  sig { params(str: String, kw: T.untyped).returns(Example::Request::Example) }
  def self.decode_json(str, **kw)
  end

  sig { params(msg: Example::Request::Example, kw: T.untyped).returns(String) }
  def self.encode_json(msg, **kw)
  end

  sig { returns(::Google::Protobuf::Descriptor) }
  def self.descriptor
  end

  sig do
    params(
      field: String
    ).void
  end
  def initialize(
    field: 
  )
  end

  sig { returns(String) }
  def field
  end

  sig { params(value: String).void }
  def field=(value)
  end

  sig { void }
  def clear_field
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

module Example::ExampleState
  self::UNSPECIFIED = T.let(0, Integer)
  self::PENDING = T.let(1, Integer)
  self::ACTIVE = T.let(2, Integer)

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
