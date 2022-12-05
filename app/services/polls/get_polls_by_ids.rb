# typed: strict

class Polls::GetPollsByIds
  class Error < ::Error; end

  class << self
    extend ::T::Sig

    sig { params(poll_ids: ::T::Array[::Integer]).returns(::T::Array[::Entities::Poll]) }
    def call(poll_ids:)
      ::Poll.
        where(id: poll_ids).
        map { |poll| ::Entities::Poll.from_model(poll) }
    rescue ::StandardError => e
      raise Error, e
    end
  end
end