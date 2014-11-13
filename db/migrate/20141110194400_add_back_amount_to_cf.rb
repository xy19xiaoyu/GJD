class AddBackAmountToCf < ActiveRecord::Migration
  def up
    add_column :info_customer_finances, :backAmount, :decimal
  end

  def down
    remove_column :info_customer_finances, :backAmount
  end
end
