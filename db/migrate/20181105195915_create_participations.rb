class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.integer :user_id
      t.integer :hunt_id

      t.timestamps
    end
  end
end
