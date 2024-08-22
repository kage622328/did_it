class DeleteChildIdNameUniqIndexFromLists < ActiveRecord::Migration[7.1]
  def change
    remove_index :lists, [:child_id, :name]
  end
end
