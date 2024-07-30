class CreateCompletedTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :completed_tasks do |t|
      t.references :child, foreign_key: true
      t.references :task, foreign_key: true
      t.integer :completed_count, default: 0, null: false

      t.timestamps
    end
    add_index :completed_tasks, [:child_id, :task_id], unique: true
  end
end
