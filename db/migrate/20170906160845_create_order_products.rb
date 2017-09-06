class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.references :order
      t.references :cart
      t.references :product
      t.integer :productcount
      t.float :item_price
      t.float :item_total_price

      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
