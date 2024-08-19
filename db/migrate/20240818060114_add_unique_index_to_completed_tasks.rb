class AddUniqueIndexToCompletedTasks < ActiveRecord::Migration[7.1]
  def change
    add_index :completed_tasks, [:child_id, :task_body], unique: true
  end
end
