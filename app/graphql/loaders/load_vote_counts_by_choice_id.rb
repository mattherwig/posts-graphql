# typed: false

module Loaders::LoadVoteCountsByChoiceId
  ::LazyLoader.register(self)

  def self.resolve(choice_id:)
    ::BatchLoader::GraphQL.for(choice_id).batch(default_value: []) do |choice_ids, loader|
      ::Votes::GetVoteCountsByChoiceIds.call(choice_ids: choice_ids).each do |result|
        loader.call(result.choice_id, result.vote_count)
      end
    end
  end
end