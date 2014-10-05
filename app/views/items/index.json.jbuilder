json.array!(@items) do |item|
  json.extract! item, :id, :ItemId, :Name, :CategoryId, :CategoryName, :subCategoryid, :subCategoryName, :Type
  json.url item_url(item, format: :json)
end
