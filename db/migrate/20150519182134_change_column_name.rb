class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :contract_types, :type, :description
  end
end
