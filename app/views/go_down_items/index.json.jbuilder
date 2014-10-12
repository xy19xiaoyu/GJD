json.array!(@go_down_items) do |go_down_item|
  json.extract! go_down_item, :id, :Order_id, :GoDowinId, :Item_id, :CreateTime, :ShelfLife, :Sum, :BatchId, :MadeIn, :InTime, :Execer, :State
  json.url go_down_item_url(go_down_item, format: :json)
end
