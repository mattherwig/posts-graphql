# typed: ignore
class Extensions::DefaultValueExtension < ::GraphQL::Schema::FieldExtension
  def after_resolve(value:, **_rest)
    if value.nil?
      options[:default_value]
    else
      value
    end
  end
end