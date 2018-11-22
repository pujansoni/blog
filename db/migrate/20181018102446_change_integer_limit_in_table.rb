class ChangeIntegerLimitInTable < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :contact_number, :integer, limit: 8
  end
end
