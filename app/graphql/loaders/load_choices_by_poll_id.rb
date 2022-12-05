# typed: false

module Loaders::LoadChoicesByPollId
  ::LazyLoader.register(self)

  def self.resolve(poll_id:)
    ::BatchLoader::GraphQL.for(poll_id).batch(default_value: []) do |poll_ids, loader|
      ::Choices::GetChoicesByPollIds.call(poll_ids: poll_ids).each do |choices|
        loader.call(choices.poll_id) { |memo| memo << choices }
      end
    end
  end
end