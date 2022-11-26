

class Users::GetAllUsers
  class Error < ::Error; end

  class << self
    extend ::T::Sig

    sig { returns(::T::Array[::Entities::User]) }
    def call
      users = ::User.all
      users.map { |user| ::Entities::User.from_model(user) }
    rescue ::StandardError
      raise Error, 'Could not process retrieving the user.'
    end
  end
end