# typed: strict

class Entities::Choice < ::T::Struct
  extend ::T::Sig

  const :id, ::Integer
  const :poll_id, ::Integer
  const :choice_text, ::String
  const :created_at, ::Time
  const :updated_at, ::Time

  sig { params(choice: ::Choice).returns(::Entities::Choice) }
  def self.from_model(choice)
    ::Entities::Choice.new(
      id: choice.id,
      poll_id: choice.poll_id,
      choice_text: choice.choice_text,
      created_at: choice.created_at,
      updated_at: choice.updated_at,
    )
  end
end