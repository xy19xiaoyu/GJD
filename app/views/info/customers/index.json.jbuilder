json.array!(@info_customers) do |info_customer|
  json.extract! info_customer, :id, :cid, :shortName, :name, :contact, :email, :tel, :fax, :address, :zip, :bank, :bankAccountNum, :bankAccountName, :deposit, :alarmMoney, :payType, :rebateFlag, :upper_id, :lower_id
  json.url info_customer_url(info_customer, format: :json)
end
