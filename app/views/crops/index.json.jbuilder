json.array!(@crops) do |crop|
  json.extract! crop, :id, :crop_type
  json.url crop_url(crop, format: :json)
end
