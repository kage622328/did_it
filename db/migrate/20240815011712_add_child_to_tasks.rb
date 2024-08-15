class AddChildToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :child, foreign_key: true
  end
end
