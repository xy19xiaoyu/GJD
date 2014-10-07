json.array!(@sub_orders) do |sub_order|
  json.extract! sub_order, :id, :OrderId, :ItemNo, :CreateTime, :ShelfLife, :Sum, :Sum1, :BatchId, :MadeIn
  json.url sub_order_url(sub_order, format: :json)
end
