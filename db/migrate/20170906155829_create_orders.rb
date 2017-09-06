class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :cart
      t.references :member
      t.references :restaurant
      t.integer :status
      t.float :total_price

      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
