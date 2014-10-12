class CreateSubOrders < ActiveRecord::Migration
  def change
    create_table :sub_orders do |t|
      t.integer :Order_id
      t.integer :Item_id
      t.string :CreateTime
      t.integer :ShelfLife
      t.integer :Sum
      t.integer :Sum1
      t.string :BatchId
      t.string :MadeIn
      t.integer :GoDown_id

      t.timestamps
    end
  end
end
