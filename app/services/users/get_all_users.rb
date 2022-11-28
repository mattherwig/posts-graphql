# typed: strict

class Users::GetAllUsers
  class Error < ::Error; end

  class << self
    extend ::T::Sig

    ::T::Sig::WithoutRuntime.sig { returns(::T::Array[::Entities::User]) }
    def call
      users = ::User.all
      users.map { |user| ::Entities::User.from_model(user) }
    rescue ::StandardError => e
      raise Error, e
    end
  end
end