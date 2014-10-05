json.array!(@go_downs) do |go_down|
  json.extract! go_down, :id, :GoDownId, :Name, :Address, :Admin, :Tel
  json.url go_down_url(go_down, format: :json)
end
