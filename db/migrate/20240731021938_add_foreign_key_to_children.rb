class AddForeignKeyToChildren < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :children, :users
  end
end
