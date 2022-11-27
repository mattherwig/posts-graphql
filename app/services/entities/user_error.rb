# typed: strict

class Entities::UserError < ::T::Struct
  const :path, [::Symbol]
  const :messages, ::T::Array[::String]
end