class AddNotNullToTaskBodyInCompletedTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :completed_tasks, :task_body, false
  end
end
