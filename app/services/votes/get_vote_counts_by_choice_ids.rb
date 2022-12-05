# typed: strict

class Votes::GetVoteCountsByChoiceIds
  class Error < ::Error; end

  class Result < ::T::Struct
    const :choice_id, ::Integer
    const :vote_count, ::Integer
  end

  class << self
    extend ::T::Sig

    sig { params(choice_ids: ::T::Array[::Integer]).returns(::T::Array[Result]) }
    def call(choice_ids:)
      votes_by_choice_ids = ::Vote.
        where(choice_id: choice_ids).
        group_by(&:choice_id)

      choice_ids.map do |choice_id|
        votes = votes_by_choice_ids[choice_id] || []

        Result.new(choice_id: choice_id, vote_count: votes.size)
      end
    rescue ::StandardError => e
      raise Error, e
    end
  end
end