json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :name, :email, :phone, :website, :country
  json.url vendor_url(vendor, format: :json)
end
