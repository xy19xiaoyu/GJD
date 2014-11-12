class AddNumTmpToCfd < ActiveRecord::Migration
  def up
    add_column :info_customer_fin_dtls, :date_tmp, :string
    add_column :info_customer_fin_dtls, :num_tmp, :integer
  end

  def down
    remove_column :info_customer_fin_dtls, :date_tmp
    remove_column :info_customer_fin_dtls, :num_tmp
  end
end
