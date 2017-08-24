class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :member
      t.references :restaurant
      t.integer :status

      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
