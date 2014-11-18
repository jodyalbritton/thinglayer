json.array!(@locations) do |location|
  json.extract! location, :id, :name, :description
  json.url location_url(location, format: :json)
end
