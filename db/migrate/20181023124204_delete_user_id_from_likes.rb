class DeleteUserIdFromLikes < ActiveRecord::Migration[5.0]
  def change
    remove_column :likes, :user_id
  end
end
