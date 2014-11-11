class AddTmpNumToCustomer < ActiveRecord::Migration
  def up
    add_column :info_customers, :tmp_cid, :integer
  end

  def down
    remove_column :info_customers, :tmp_cid
  end
end
