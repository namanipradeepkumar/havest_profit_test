class AddCashPriceToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :cash_price, :string
  end
end
