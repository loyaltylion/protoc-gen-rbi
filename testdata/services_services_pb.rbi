# Code generated by protoc-gen-rbi. DO NOT EDIT.
# source: services.proto
# typed: strict

module Testdata::SimpleMathematics
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
        request: Testdata::Subdir::IntegerMessage
      ).returns(Testdata::Subdir::IntegerMessage)
    end
    def negate(request)
    end

    sig do
      params(
        request: T::Enumerable[Testdata::Subdir::IntegerMessage]
      ).returns(Testdata::Subdir::IntegerMessage)
    end
    def median(request)
    end
  end

  sig do
    params(
      value: T.nilable(Integer)
    ).returns(Testdata::Subdir::IntegerMessage)
  end
  def self.negate(
    value: 0
  )
  end

  sig do
    params(
      value: T.nilable(Integer)
    ).returns(Testdata::Subdir::IntegerMessage)
  end
  def self.median(
    value: 0
  )
  end
end

module Testdata::ComplexMathematics
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
        request: Testdata::Subdir::IntegerMessage
      ).returns(T::Enumerable[Testdata::Subdir::IntegerMessage])
    end
    def fibonacci(request)
    end

    sig do
      params(
        request: T::Enumerable[Testdata::Subdir::IntegerMessage]
      ).returns(T::Enumerable[Testdata::Subdir::IntegerMessage])
    end
    def running_max(request)
    end

    sig do
      params(
        request: T::Enumerable[Testdata::Subdir::IntegerMessage]
      ).returns(T::Enumerable[Testdata::Subdir::IntegerMessage])
    end
    def periodic_max(request)
    end
  end

  sig do
    params(
      value: T.nilable(Integer)
    ).returns(T::Enumerable[Testdata::Subdir::IntegerMessage])
  end
  def self.fibonacci(
    value: 0
  )
  end

  sig do
    params(
      value: T.nilable(Integer)
    ).returns(T::Enumerable[Testdata::Subdir::IntegerMessage])
  end
  def self.running_max(
    value: 0
  )
  end

  sig do
    params(
      value: T.nilable(Integer)
    ).returns(T::Enumerable[Testdata::Subdir::IntegerMessage])
  end
  def self.periodic_max(
    value: 0
  )
  end
end
