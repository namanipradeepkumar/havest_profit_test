class CreateFertUnits < ActiveRecord::Migration
  def change
    create_table :fert_units do |t|
      t.string :type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
