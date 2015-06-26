json.array!(@contracts) do |contract|
  json.extract! contract, :id, :sale_type, :open_order, :bushels, :delivery_location, :futures_month, :futures_price, :basis, :contract_number, :long_short, :contracts, :strike_price, :gain_loss, :delivery_period, :year, :user_id
  json.url contract_url(contract, format: :json)
end
