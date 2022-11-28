# typed: false

module Loaders::LoadPostByPostId
  ::LazyLoader.register(self)

  def self.resolve(post_id:)
    ::BatchLoader::GraphQL.for(post_id).batch do |post_ids, loader|
      ::Posts::GetPostsByIds.call(post_ids: post_ids).each do |post|
        loader.call(post.id, post)
      end
    end
  end
end