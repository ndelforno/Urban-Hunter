class RemoveHuntUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :hunts_users
  end
end
