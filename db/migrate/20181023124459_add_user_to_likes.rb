class AddUserToLikes < ActiveRecord::Migration[5.0]
  def change
    add_reference :likes, :user, index: true
  end
end
