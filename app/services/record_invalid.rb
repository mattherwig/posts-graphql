# typed: false
class RecordInvalid < ::Error
  extend ::T::Sig

  sig { params(error: ::ActiveRecord::RecordInvalid).void }
  def initialize(error)
    @error = error
    super
  end

  sig { returns(::T::Array[::Entities::UserError]) }
  def user_errors
    argument_to_errors.map do |(path, messages)|
      ::Entities::UserError.new(
        path: [path],
        messages: messages
      )
    end
  end

  private

  sig { returns(::T::Hash[::Symbol, ::T::Array[::String]]) }
  def argument_to_errors
    @error.record.errors.messages.to_h
  end
end