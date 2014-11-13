class AddCommentOrderIdToFinanceDtl < ActiveRecord::Migration
  def up
    add_column :info_customer_fin_dtls, :comment, :string
    add_column :info_customer_fin_dtls, :order_id, :integer
    remove_column :info_customer_fin_dtls, :cfd_id
    add_column :info_customer_fin_dtls, :cfd_id, :string
  end

  def down
    remove_column :info_customer_fin_dtls, :comment
    remove_column :info_customer_fin_dtls, :order_id
    add_column :info_customer_fin_dtls, :cfd_id, :integer
    remove_column :info_customer_fin_dtls, :cfd_id
  end
end
