class AddDeliveryDetailToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :has_delivery , :boolean
    add_column :restaurants, :has_collection , :boolean
    add_column :restaurants, :delivery_time, :string
  end
end
