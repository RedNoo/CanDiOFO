class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :line_no
      t.float :price
      t.references :category
      t.references :restaurant

      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
