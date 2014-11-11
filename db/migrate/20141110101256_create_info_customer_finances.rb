class CreateInfoCustomerFinances < ActiveRecord::Migration
  def change
    create_table :info_customer_finances do |t|
      t.decimal :amount
      t.integer :customer_id

      t.timestamps
    end
  end
end
