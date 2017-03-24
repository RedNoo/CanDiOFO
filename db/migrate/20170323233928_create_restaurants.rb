class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.decimal :rating_point
      t.decimal :rating_count
      t.integer :open_time
      t.integer :close_time
      t.string :post_code
      t.float :lat
      t.float :lng
      t.references :user

      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
