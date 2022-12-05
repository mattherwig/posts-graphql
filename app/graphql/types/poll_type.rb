# typed: ignore
# frozen_string_literal: true

module Types
  class PollType < Types::BaseObject
    field :id, ID, null: false
    field :question, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user, Types::UserType, null: false
    field :choices, Types::ChoiceType.connection_type, null: false

    def user
      ::Loaders::LoadUserByUserId.resolve(user_id: object.user_id)
    end

    def choices
      ::Loaders::LoadChoicesByPollId.resolve(poll_id: object.id)
    end
  end
end
