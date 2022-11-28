# typed: ignore
module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, Types::UserType.connection_type, null: false
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true, as: :user_id
    end
    field :posts, Types::PostType.connection_type, null: false
    field :post, Types::PostType, null: false do
      argument :id, ID, required: true, as: :post_id
    end

    def users
      ::Users::GetAllUsers.call
    end

    def user(user_id:)
      ::Loaders::LoadUserByUserId.resolve(user_id: Integer(user_id))
    end

    def posts
      ::Posts::GetAllPosts.call
    end

    def post(post_id:)
      ::Loaders::LoadPostByPostId.resolve(post_id: Integer(post_id))
    end
  end
end
