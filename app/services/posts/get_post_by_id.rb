# typed: strict

class Posts::GetPostById
  class Error < ::Error; end
  class RecordNotFound < Error; end

  class << self
    extend ::T::Sig

    sig { params(post_id: ::Integer).returns(::Entities::Post) }
    def call(post_id:)
      user = ::Post.find(post_id)

      ::Entities::Post.from_model(user)
    rescue ::ActiveRecord::RecordNotFound => e
      raise RecordNotFound, e
    rescue ::StandardError => e
      raise Error, e
    end
  end
end