class DeleteReferencesFromLikes < ActiveRecord::Migration[5.0]
  def change
    remove_column :likes, :references
  end
end
