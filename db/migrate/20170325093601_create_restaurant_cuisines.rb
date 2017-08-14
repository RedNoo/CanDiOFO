class CreateRestaurantCuisines < ActiveRecord::Migration
  def change
    create_table :restaurant_cuisines do |t|
      t.references :user
      t.references :restaurant

      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
