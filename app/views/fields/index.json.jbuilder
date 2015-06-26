json.array!(@fields) do |field|
  json.extract! field, :id, :description, :acres
  json.url field_url(field, format: :json)
end
