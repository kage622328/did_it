class AddListToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :list, foreign_key: true
  end
end
