json.array!(@o_orders) do |o_order|
  json.extract! o_order, :id, :OrderId, :Name, :Type, :CreateTime, :CreateUser, :ExecTime, :Execer, :State, :Customer, :Address
  json.url o_order_url(o_order, format: :json)
end
