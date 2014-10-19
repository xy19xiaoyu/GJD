class CreateOOrderItems < ActiveRecord::Migration
  def change
    create_table :o_order_items do |t|
      t.integer :OOrder_id
      t.integer :Item_id
      t.integer :Sum

      t.timestamps
    end
  end
end
