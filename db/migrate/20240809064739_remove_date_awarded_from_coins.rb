class RemoveDateAwardedFromCoins < ActiveRecord::Migration[7.1]
  def change
    remove_column :coins, :date_awarded, :datetime
  end
end
