json.array!(@products) do |product|
  json.extract! product, :id, :product_type
  json.url product_url(product, format: :json)
end
