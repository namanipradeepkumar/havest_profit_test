class AddUserIdToCrop < ActiveRecord::Migration
  def change
    add_column :crops, :user_id, :integer
  end
end
