# typed: strict

class Choices::GetChoicesByPollIds
  class Error < ::Error; end
  class RecordNotFound < Error; end

  class << self
    extend ::T::Sig

    sig { params(poll_ids: ::T::Array[::Integer]).returns(::T::Array[::Entities::Choice]) }
    def call(poll_ids:)
      ::Choice.where(poll_id: poll_ids).
        map { |choice| ::Entities::Choice.from_model(choice) }
    rescue ::ActiveRecord::RecordNotFound => e
      raise RecordNotFound, e
    rescue ::StandardError => e
      raise Error, e
    end
  end
end