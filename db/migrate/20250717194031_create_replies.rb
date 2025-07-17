class CreateReplies < ActiveRecord::Migration[8.0]
  def change
    create_table :replies do |t|
      t.belongs_to :post, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.string :content, null: false

      t.timestamps
    end
  end
end
