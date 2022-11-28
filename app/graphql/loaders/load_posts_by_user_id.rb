# typed: false

module Loaders::LoadPostsByUserId
  ::LazyLoader.register(self)

  def self.resolve(user_id:)
    ::BatchLoader::GraphQL.for(user_id).batch(default_value: []) do |user_ids, loader|
      ::Posts::GetPostsByUserIds.call(user_ids: user_ids).each do |post|
        loader.call(post.user_id) { |memo| memo << post }
      end
    end
  end
end