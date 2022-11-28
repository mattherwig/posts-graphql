# typed: false

module Loaders::LoadUserByUserId
  ::LazyLoader.register(self)

  def self.resolve(user_id:)
    ::BatchLoader::GraphQL.for(user_id).batch do |user_ids, loader|
      ::Users::GetUsersByIds.call(user_ids: user_ids).each do |user|
        loader.call(user.id, user)
      end
    end
  end
end