class CreateChildren < ActiveRecord::Migration[7.1]
  def change
    create_table :children do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
    add_index :children, [:user_id, :name], unique: true
  end
end
