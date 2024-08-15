class RemoveChildIdFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :child_id, :integer
  end
end
