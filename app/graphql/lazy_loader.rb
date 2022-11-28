# typed: true
# frozen_string_literal: true

class LazyLoader
  def self.register(loader)
    PostsGraphqlSchema.lazy_resolve(loader, :resolve)
  end
end
