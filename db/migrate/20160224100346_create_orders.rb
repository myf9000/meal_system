class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :meal, index: true, foreign_key: true
      t.string :status, default: "ordered"

      t.timestamps null: false
    end
  end
end
