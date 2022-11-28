# typed: strict

class Users::GetUsersByIds
  class Error < ::Error; end

  class << self
    extend ::T::Sig

    sig { params(user_ids: ::T::Array[::Integer]).returns(::T::Array[::Entities::User]) }
    def call(user_ids:)
      ::User.
        where(id: user_ids).
        map { |user| ::Entities::User.from_model(user) }
    rescue ::StandardError => e
      raise Error, e
    end
  end
end