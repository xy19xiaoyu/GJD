class CreateInfoCustomerFinDtls < ActiveRecord::Migration
  def change
    create_table :info_customer_fin_dtls do |t|
      t.integer :customer_fin_id
      t.timestamp :do_time
      t.boolean :in_or_out
      t.decimal :money
      t.integer :cfd_id
      t.integer :status_id

      t.timestamps
    end
  end
end
