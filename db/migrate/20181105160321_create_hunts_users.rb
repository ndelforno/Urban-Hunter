class CreateHuntsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :hunts_users do |t|
      t.integer :user_id
      t.integer :hunt_id
    end
  end
end
