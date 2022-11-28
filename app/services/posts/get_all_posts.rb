# typed: strict

class Posts::GetAllPosts
  class Error < ::Error; end

  class << self
    extend ::T::Sig

    ::T::Sig::WithoutRuntime.sig { returns(::T::Array[::Entities::Post]) }
    def call
      posts = ::Post.all
      posts.map { |post| ::Entities::Post.from_model(post) }
    rescue ::StandardError => e
      raise Error, e
    end
  end
end