class DropContractTypes < ActiveRecord::Migration
  def up
    drop_table :contract_types
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
