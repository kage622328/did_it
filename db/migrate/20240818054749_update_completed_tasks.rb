class UpdateCompletedTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :completed_tasks, :task_id, :integer
    add_column :completed_tasks, :task_body, :string
    change_column_default :completed_tasks, :completed_count, from: 0, to: 1
  end
end
