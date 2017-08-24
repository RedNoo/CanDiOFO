class CreateCartproducts < ActiveRecord::Migration
  def change
    create_table :cartproducts do |t|
      t.references :cart
      t.references :product
      t.integer :productcount
      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
