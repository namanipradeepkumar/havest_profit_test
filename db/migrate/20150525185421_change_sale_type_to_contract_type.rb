class ChangeSaleTypeToContractType < ActiveRecord::Migration
  def change
		rename_column :contracts, :sale_type, :contract_type
  end
end
