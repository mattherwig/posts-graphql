# typed: ignore
# frozen_string_literal: true

module Types
  class UserErrorType < Types::BaseObject
    field :path, [String]
    field :messages, [String]
  end
end
