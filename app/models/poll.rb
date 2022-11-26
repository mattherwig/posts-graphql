# == Schema Information
#
# Table name: polls
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  question   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_polls_on_user_id  (user_id)
#
class Poll < ApplicationRecord
  belongs_to :user
  has_many :choices
end
