# typed: true
class CreatePolls < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.belongs_to :user, null: false, foreign_key: { on_delete: :cascade }
      t.string :question

      t.timestamps
    end
  end
end
