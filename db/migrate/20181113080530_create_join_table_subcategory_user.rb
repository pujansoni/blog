class CreateJoinTableSubcategoryUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :subcategories, :users do |t|
      # t.index [:subcategory_id, :user_id]
      t.index [:user_id, :subcategory_id]
    end
  end
end
