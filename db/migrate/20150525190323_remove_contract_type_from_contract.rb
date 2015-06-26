class RemoveContractTypeFromContract < ActiveRecord::Migration
  def change
  	remove_column :contracts, :contract_type, :string
  	add_column :contracts, :contract_type_id, :integer
  end
end
