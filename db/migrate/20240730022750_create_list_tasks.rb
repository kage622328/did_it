class CreateListTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :list_tasks do |t|
      t.references :list, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
    add_index :list_tasks, [:list_id, :task_id], unique: true
  end
end
