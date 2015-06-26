class AddRentToFields < ActiveRecord::Migration
  def change
    add_column :fields, :rent, :integer
  end
end
