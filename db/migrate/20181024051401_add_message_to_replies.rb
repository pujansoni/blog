class AddMessageToReplies < ActiveRecord::Migration[5.0]
  def change
    add_column :replies, :message, :string
  end
end
