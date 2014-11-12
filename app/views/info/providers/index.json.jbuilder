json.array!(@info_providers) do |info_provider|
  json.extract! info_provider, :id, :cid, :shortName, :name, :contact, :email, :tel, :fax, :address, :zip, :bank, :bankAccountNum, :bankAccountName, :deposit, :alarmMoney, :payType, :rebateFlag, :upper_id, :lower_id
  json.url info_provider_url(info_provider, format: :json)
end
