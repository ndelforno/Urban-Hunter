class AddMaxCapacity < ActiveRecord::Migration[5.2]
  def change
    add_column :hunts, :max_participants, :integer
  end
end
