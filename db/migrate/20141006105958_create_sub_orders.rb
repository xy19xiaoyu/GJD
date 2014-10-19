class CreateSubOrders < ActiveRecord::Migration
  def change
    create_table :sub_orders do |t|
      t.string :OrderId
      t.string :ItemNo
      t.string :CreateTime
      t.integer :ShelfLife
      t.integer :Sum
      t.integer :Sum1
      t.string :BatchId
      t.string :MadeIn

      t.timestamps
    end
  end
end
