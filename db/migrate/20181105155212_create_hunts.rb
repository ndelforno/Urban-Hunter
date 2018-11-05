class CreateHunts < ActiveRecord::Migration[5.2]
  def change
    create_table :hunts do |t|
      t.string :name
      t.integer :difficulty_level
      t.integer :user_id
      t.integer :category_id
      t.datetime :date_time

      t.timestamps
    end
  end
end
