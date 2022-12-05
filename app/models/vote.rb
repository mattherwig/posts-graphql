# typed: false
# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  poll_id    :bigint           default(0), not null
#  choice_id  :bigint           default(0), not null
#  user_id    :bigint           default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_votes_on_choice_id              (choice_id)
#  index_votes_on_choice_id_and_poll_id  (choice_id,poll_id) UNIQUE
#  index_votes_on_poll_id                (poll_id)
#  index_votes_on_user_id                (user_id)
#
class Vote < ApplicationRecord
  belongs_to :poll
  belongs_to :choice
  belongs_to :user

  validates :user_id, uniqueness: { scope: :poll }
end
