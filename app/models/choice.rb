# typed: false
# == Schema Information
#
# Table name: choices
#
#  id          :bigint           not null, primary key
#  poll_id     :bigint           default(0), not null
#  choice_text :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_choices_on_poll_id  (poll_id)
#
class Choice < ApplicationRecord
  belongs_to :poll
  has_many :votes, dependent: :delete_all
end
