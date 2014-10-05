json.array!(@categories) do |category|
  json.extract! category, :id, :Name, :Type
end
