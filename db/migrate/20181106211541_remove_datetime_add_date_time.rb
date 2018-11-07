class RemoveDatetimeAddDateTime < ActiveRecord::Migration[5.2]
  def change
    add_column :hunts, :hunt_date, :datetime
    add_column :hunts, :hunt_time, :datetime
    remove_column :hunts, :date_time
  end
end
