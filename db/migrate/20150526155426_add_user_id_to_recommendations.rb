class AddUserIdToRecommendations < ActiveRecord::Migration
  def change
    add_reference :recommendations, :user, index: true
    add_foreign_key :recommendations, :users
  end
end
