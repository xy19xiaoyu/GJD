class CreateOutOrderItemHis < ActiveRecord::Migration
  def change
    create_table :out_order_item_his do |t|
      t.integer :OOrder_id
      t.integer :OutOrder_id
      t.integer :Item_id
      t.integer :GoDown_id
      t.string :BatchId
      t.date :CreateTime
      t.integer :Sum
      t.date :ExecTime
      t.string :Execer

      t.timestamps
    end
  end
end
