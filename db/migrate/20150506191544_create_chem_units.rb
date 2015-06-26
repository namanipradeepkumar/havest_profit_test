class CreateChemUnits < ActiveRecord::Migration
  def change
    create_table :chem_units do |t|
      t.string :type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
