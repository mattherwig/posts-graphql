# typed: true
class VotesUniqueConstraint < ActiveRecord::Migration[7.0]
  def change
    add_index :votes, [:choice_id, :poll_id], unique: true
  end
end
