class AddUserToReply < ActiveRecord::Migration[5.0]
  def change
    add_reference :replies, :user, index: true
  end
end
