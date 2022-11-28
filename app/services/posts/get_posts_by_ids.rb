# typed: strict

class Posts::GetPostsByIds
  class Error < ::Error; end

  class << self
    extend ::T::Sig

    sig { params(post_ids: ::T::Array[::Integer]).returns(::T::Array[::Entities::Post]) }
    def call(post_ids:)
      ::Post.
        where(id: post_ids).
        map { |post| ::Entities::Post.from_model(post) }
    rescue ::StandardError => e
      raise Error, e
    end
  end
end