# Code generated by protoc-gen-rbi. DO NOT EDIT.
# source: example.proto
# typed: strict
# rubocop:disable all

module Example::Greeter
  class Service
    include ::GRPC::GenericService
  end

  class Stub < ::GRPC::ClientStub
    sig do
      params(
        host: String,
        creds: T.any(::GRPC::Core::ChannelCredentials, Symbol),
        kw: T.untyped,
      ).void
    end
    def initialize(host, creds, **kw)
    end

    sig do
      params(
        request: Example::Request
      ).returns(Example::Response)
    end
    def hello(request)
    end
  end

  sig do
    params(
      name: String,
      test_list: T.any(T::Array[String], ::Google::Protobuf::RepeatedField[String]),
      example: Example::Request::Example,
      example_map: T.any(T::Hash[String, String], ::Google::Protobuf::Map[String, String]),
      count: T.nilable(Integer),
      optional_example: T.nilable(Example::Request::Example),
      internal_id: T.nilable(Integer),
      external_id: T.nilable(Integer),
      resolver: T.nilable(Example::Request::Resolver)
    ).returns(Example::Response)
  end
  def self.hello(
    name: ,
    test_list: ,
    example: ,
    example_map: ,
    count: 0,
    optional_example: nil,
    internal_id: 0,
    external_id: 0,
    resolver: nil
  )
  end
end
