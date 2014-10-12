class CreateInOrders < ActiveRecord::Migration
  def change
    create_table :in_orders do |t|
      t.integer :Order_id
      t.integer :GoDown_id
      t.string :InOrderId
      t.string :Name
      t.string :Type
      t.date :CreateTime
      t.string :CreateUser
      t.date :ExecTime
      t.string :Execer
      t.string :State

      t.timestamps
    end
  end
end
