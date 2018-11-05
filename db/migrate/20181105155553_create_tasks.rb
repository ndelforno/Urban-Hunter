class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :address
      t.integer :hunt_id
      t.string :details
      t.string :neighbourhood

      t.timestamps
    end
  end
end
