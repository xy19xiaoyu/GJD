class CreateInfoCustomers < ActiveRecord::Migration
  def change
    create_table :info_customers do |t|
      t.string :cid
      t.string :shortName
      t.string :name
      t.string :contact
      t.string :email
      t.string :tel
      t.string :fax
      t.string :address
      t.string :zip
      t.string :bank
      t.string :bankAccountNum
      t.string :bankAccountName
      t.integer :deposit
      t.integer :alarmMoney
      t.integer :payType
      t.boolean :rebateFlag
      t.integer :upper_id
      t.integer :lower_id

      t.timestamps
    end
  end
end
