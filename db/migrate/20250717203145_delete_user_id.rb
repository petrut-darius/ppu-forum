class DeleteUserId < ActiveRecord::Migration[8.0]
  def change
    remove_reference :replies, :user, foreign_key: true
  end
end
