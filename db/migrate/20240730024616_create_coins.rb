class CreateCoins < ActiveRecord::Migration[7.1]
  def change
    create_table :coins do |t|
      t.references :child, foreign_key: true
      t.integer :coin_amount, default: 0, null: false
      t.datetime :date_awarded, null: false

      t.timestamps
    end
  end
end
