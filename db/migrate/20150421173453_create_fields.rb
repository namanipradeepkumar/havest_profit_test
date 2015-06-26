class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :description
      t.integer :acres
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
