class RemoveForeignKeyFromChildren < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :children, :users
  end  
end
