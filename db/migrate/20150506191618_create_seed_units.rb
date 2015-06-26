class CreateSeedUnits < ActiveRecord::Migration
  def change
    create_table :seed_units do |t|
      t.string :type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
