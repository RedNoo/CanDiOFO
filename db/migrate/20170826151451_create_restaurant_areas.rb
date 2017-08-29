class CreateRestaurantAreas < ActiveRecord::Migration
  def change
    create_table :restaurant_areas do |t|

      t.string :post_code
      t.float :delivery_fee
      t.string :delivery_fee_text
      t.references :restaurant
      
      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
