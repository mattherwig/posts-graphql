# typed: false

class Entities::User < ::T::Struct
  extend ::T::Sig

  const :id, ::Integer
  const :name, ::String
  const :email, ::String
  const :created_at, ::Time
  const :updated_at, ::Time

  sig { params(user: ::User).returns(::Entities::User) }
  def self.from_model(user)
    ::Entities::User.new(
      id: user.id,
      name: user.name,
      email: user.email,
      created_at: user.created_at,
      updated_at: user.updated_at,
    )
  end
end