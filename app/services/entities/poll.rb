# typed: strict

class Entities::Poll < ::T::Struct
  extend ::T::Sig

  const :id, ::Integer
  const :user_id, ::Integer
  const :question, ::String
  const :created_at, ::Time
  const :updated_at, ::Time

  sig { params(poll: ::Poll).returns(::Entities::Poll) }
  def self.from_model(poll)
    ::Entities::Poll.new(
      id: poll.id,
      user_id: poll.user_id,
      question: poll.question,
      created_at: poll.created_at,
      updated_at: poll.updated_at,
    )
  end
end