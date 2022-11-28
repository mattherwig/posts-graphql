# typed: strict

class Users::CreateUser
  class Error < ::Error; end
  class RecordInvalidError < ::RecordInvalid; end

  class << self
    extend ::T::Sig

    sig { params(name: ::String, email: ::String).returns(::Entities::User) }
    def call!(name:, email:)
      user = ::User.create!(name: name, email: email)

      ::Entities::User.from_model(user)
    rescue ::ActiveRecord::RecordInvalid => e
      raise RecordInvalidError, e
    rescue ::StandardError => e
      raise Error, e
    end
  end
end