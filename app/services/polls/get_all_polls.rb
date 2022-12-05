# typed: strict

class Polls::GetAllPolls
  class Error < ::Error; end

  class << self
    extend ::T::Sig

    ::T::Sig::WithoutRuntime.sig { returns(::T::Array[::Entities::Poll]) }
    def call
      posts = ::Poll.all
      posts.map { |post| ::Entities::Poll.from_model(post) }
    rescue ::StandardError => e
      raise Error, e
    end
  end
end