# typed: ignore

class Mutations::CreateUser < Mutations::BaseMutation
  argument :name, String, required: true
  argument :email, String, required: true

  field :user, Types::UserType, null: true, fallback_value: nil
  field :errors, [Types::UserErrorType], null: false, fallback_value: []

  def resolve(name:, email:)
    user = ::Users::CreateUser.call!(name: name, email: email)

    { user: user }
  rescue ::Users::CreateUser::RecordInvalidError => e
    { errors: e.user_errors }
  rescue ::Users::CreateUser::Error => e
    { errors: e.user_errors }
  end
end
