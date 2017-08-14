class AddRestaurantToRestaurantCuisines < ActiveRecord::Migration
  def change
    add_column  :restaurant_cuisines, :cuisine_id , :integer
  end
end
