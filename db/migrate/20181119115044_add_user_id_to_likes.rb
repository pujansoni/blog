class AddUserIdToLikes < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :user_id, :integer
  end
end
