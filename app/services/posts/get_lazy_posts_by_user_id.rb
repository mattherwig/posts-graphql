# typed: strict

class Posts::GetLazyPostsByUserId
  class Error < ::Error; end
  class RecordNotFound < Error; end

  class << self
    extend ::T::Sig

    # Deprecated: Probably better to handle the lazy loading + prefer bulk API
    #             where we can expect N+1
    ::T::Sig::WithoutRuntime.sig { params(user_id: ::Integer).returns(::T::Array[::Entities::Post]) }
    def call(user_id:)
      ::BatchLoader.for(user_id).batch(default_value: []) do |user_ids, loader|
        ::Post.where(user_id: user_ids).each do |post|
          loader.call(post.user_id) { |memo| memo << ::Entities::Post.from_model(post) }
        end
      end
    rescue ::ActiveRecord::RecordNotFound => e
      raise RecordNotFound, e
    rescue ::StandardError => e
      raise Error, e
    end
  end
end