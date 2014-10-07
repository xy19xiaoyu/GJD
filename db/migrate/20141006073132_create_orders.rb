class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :OrderId
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
