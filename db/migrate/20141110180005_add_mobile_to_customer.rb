class AddMobileToCustomer < ActiveRecord::Migration
  def up
    add_column :info_customers, :mobile_tel, :integer
  end

  def down
    remove_column :info_customers, :mobile_tel
  end
end
