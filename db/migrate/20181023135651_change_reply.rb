class ChangeReply < ActiveRecord::Migration[5.0]
  def change
    rename_column :replies, :likeable_id, :replyable_id
    rename_column :replies, :likeable_type, :replyable_type
  end
end
