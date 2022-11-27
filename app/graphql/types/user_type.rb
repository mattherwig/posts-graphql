# typed: ignore
# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :email, String
    field :posts, Types::PostType.connection_type, null: false
    field :post_count, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def posts
      @posts ||= ::Post.where(user_id: object.id)
    end

    def post_count
      posts.size
    end
  end
end
