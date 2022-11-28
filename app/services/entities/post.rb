# typed: strict

class Entities::Post < ::T::Struct
  extend ::T::Sig

  const :id, ::Integer
  const :user_id, ::Integer
  const :title, ::String
  const :body, ::String
  const :created_at, ::Time
  const :updated_at, ::Time

  sig { params(user: ::Post).returns(::Entities::Post) }
  def self.from_model(user)
    ::Entities::Post.new(
      id: user.id,
      user_id: user.user_id,
      title: user.title,
      body: user.body,
      created_at: user.created_at,
      updated_at: user.updated_at,
    )
  end
end