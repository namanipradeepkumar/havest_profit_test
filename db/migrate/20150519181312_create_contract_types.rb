class CreateContractTypes < ActiveRecord::Migration
  def change
    create_table :contract_types do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end
