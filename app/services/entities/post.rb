# typed: strict

class Entities::Post < ::T::Struct
  extend ::T::Sig

  const :id, ::Integer
  const :user_id, ::Integer
  const :title, ::String
  const :body, ::String
  const :created_at, ::Time
  const :updated_at, ::Time

  sig { params(post: ::Post).returns(::Entities::Post) }
  def self.from_model(post)
    ::Entities::Post.new(
      id: post.id,
      user_id: post.user_id,
      title: post.title,
      body: post.body,
      created_at: post.created_at,
      updated_at: post.updated_at,
    )
  end
end