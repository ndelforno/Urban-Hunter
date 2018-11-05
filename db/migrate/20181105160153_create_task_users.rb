class CreateTaskUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :task_users do |t|
      t.integer :user_id
      t.integer :task_id
      t.string :proof
      t.boolean :completed

      t.timestamps
    end
  end
end
