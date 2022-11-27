# typed: false
class Users::GetUserById
  class Error < ::Error; end
  class RecordNotFound < Error; end

  class << self
    extend ::T::Sig

    sig { params(user_id: Integer).returns(::Entities::User) }
    def call(user_id:)
      user = ::User.find(user_id)

      ::Entities::User.from_model(user)
    rescue ::ActiveRecord::RecordNotFound
      raise RecordNotFound, 'Could not find the given user.'
    rescue ::StandardError
      raise Error, 'Could not process retrieving the user.'
    end
  end
end