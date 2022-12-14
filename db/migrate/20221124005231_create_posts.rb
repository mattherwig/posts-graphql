# typed: true
class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, null: false, foreign_key: { on_delete: :cascade }
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
