class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.integer :likeable_id
      t.string :likeable_type

      t.timestamps
    end
  end
end
