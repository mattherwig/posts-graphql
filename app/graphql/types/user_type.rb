# typed: ignore
# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :email, String
    field :deprecated_posts, Types::PostType.connection_type, null: false
    field :posts, Types::PostType.connection_type, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def deprecated_posts
      ::BatchLoader::GraphQL.wrap(::Posts::GetLazyPostsByUserId.call(user_id: object.id))
    end

    def posts
      ::Loaders::LoadPostsByUserId.resolve(user_id: object.id)
    end
  end
end
