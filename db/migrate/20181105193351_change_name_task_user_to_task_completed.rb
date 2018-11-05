class ChangeNameTaskUserToTaskCompleted < ActiveRecord::Migration[5.2]
  def change
    rename_table :task_users, :completed_tasks
  end
end
