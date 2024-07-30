class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :body, null: false, limit: 255
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
