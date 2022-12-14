# typed: strict

class Users::GetUserById
  class Error < ::Error; end
  class RecordNotFound < Error; end

  class << self
    extend ::T::Sig

    sig { params(user_id: ::Integer).returns(::Entities::User) }
    def call(user_id:)
      user = ::User.find(user_id)

      ::Entities::User.from_model(user)
    rescue ::ActiveRecord::RecordNotFound => e
      raise RecordNotFound, e
    rescue ::StandardError => e
      raise Error, e
    end
  end
end