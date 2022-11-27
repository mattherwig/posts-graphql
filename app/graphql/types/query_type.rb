# typed: ignore
module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, Types::UserType.connection_type, null: false
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def users
      ::Users::GetAllUsers.call
    end

    def user(id:)
      ::Users::GetUserById.call(user_id: Integer(id))
    end
  end
end
