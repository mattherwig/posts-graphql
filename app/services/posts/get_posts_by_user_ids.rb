# typed: strict

class Posts::GetPostsByUserIds
  class Error < ::Error; end
  class RecordNotFound < Error; end

  class << self
    extend ::T::Sig

    sig { params(user_ids: ::T::Array[::Integer]).returns(::T::Array[::Entities::Post]) }
    def call(user_ids:)
      ::Post.where(user_id: user_ids).
        map { |post| ::Entities::Post.from_model(post) }
    rescue ::ActiveRecord::RecordNotFound => e
      raise RecordNotFound, e
    rescue ::StandardError => e
      raise Error, e
    end
  end
end