# typed: true
class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.belongs_to :poll, null: false, foreign_key: { on_delete: :cascade }
      t.string :choice_text

      t.timestamps
    end
  end
end
