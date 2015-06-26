class CreateInputs < ActiveRecord::Migration
  def change
    create_table :inputs do |t|
      t.string :product
      t.float :price
      t.string :units
      t.string :supplier
      t.integer :year
      t.integer :user_id
      t.string :input_type
      t.float :quantity

      t.timestamps null: false
    end
  end
end
