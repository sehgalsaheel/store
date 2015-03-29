json.array!(@items) do |item|
  json.extract! item, :id, :name, :thumbnail, :price, :category, :sort
  json.url item_url(item, format: :json)
end
