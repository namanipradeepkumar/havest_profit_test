class AddShareToFields < ActiveRecord::Migration
  def change
    add_column :fields, :share, :decimal
  end
end
