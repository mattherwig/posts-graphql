# typed: false

module Loaders::LoadPollByPollId
  ::LazyLoader.register(self)

  def self.resolve(poll_id:)
    ::BatchLoader::GraphQL.for(poll_id).batch do |poll_ids, loader|
      ::Polls::GetPollsByIds.call(poll_ids: poll_ids).each do |poll|
        loader.call(poll.id, poll)
      end
    end
  end
end