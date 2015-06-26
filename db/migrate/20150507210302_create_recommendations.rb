class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.text :body

      t.timestamps null: false
    end
  end
end
