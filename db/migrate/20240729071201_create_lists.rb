class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.references :child, foreign_key: true
      t.string :name, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
    add_index :lists, [:child_id, :name], unique: true
  end
end
