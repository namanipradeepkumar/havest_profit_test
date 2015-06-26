class AddConsultantIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :consultant, index: true
    add_foreign_key :users, :consultants
  end
end
