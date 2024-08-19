class ChangeDefaultCompletedCountInCompletedTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_default :completed_tasks, :completed_count, from: 1, to: 0
  end
end
