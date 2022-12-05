# typed: ignore
# frozen_string_literal: true

module Types
  class ChoiceType < Types::BaseObject
    field :id, ID, null: false
    field :choice_text, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :vote_count, Integer, null: false

    def vote_count
      ::Loaders::LoadVoteCountsByChoiceId.resolve(choice_id: object.id)
    end
  end
end
