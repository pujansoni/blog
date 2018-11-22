class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.date :date_of_birth
      t.integer :age
      t.integer :contact_number
      t.string :address
      t.string :password

      t.timestamps
    end
  end
end
