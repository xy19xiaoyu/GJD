class CreateOOrders < ActiveRecord::Migration
  def change
    create_table :o_orders do |t|
      t.string :OrderId
      t.string :Name
      t.string :Type
      t.date :CreateTime
      t.string :CreateUser
      t.date :ExecTime
      t.string :Execer
      t.string :State
      t.string :Customer
      t.string :Address

      t.timestamps
    end
  end
end
