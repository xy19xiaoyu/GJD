class DeleteLowerIdFromCustomer < ActiveRecord::Migration
  def up
    remove_column :info_customers, :lower_id
  end

  def down
    add_column :info_customers, :lower_id, :integer
  end
end
