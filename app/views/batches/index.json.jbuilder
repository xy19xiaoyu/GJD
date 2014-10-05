json.array!(@batches) do |batch|
  json.extract! batch, :id, :Batchid, :Date
  json.url batch_url(batch, format: :json)
end
