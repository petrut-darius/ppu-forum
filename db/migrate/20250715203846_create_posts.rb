class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :question
      t.string :description_of_question
      t.belongs_to :subforum, index: true, foreign_key: true

      t.timestamps
    end
  end
end
