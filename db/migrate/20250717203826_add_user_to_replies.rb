class AddUserToReplies < ActiveRecord::Migration[8.0]
  def change
    add_reference :replies, :user, null: false, foreign_key: true
  end
end
