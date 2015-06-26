json.array!(@inputs) do |input|
  json.extract! input, :id, :product, :price, :units, :supplier, :year, :user_id, :input_type, :quantity
  json.url input_url(input, format: :json)
end
