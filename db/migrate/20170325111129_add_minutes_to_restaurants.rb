class AddMinutesToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :open_time_minute , :integer
    add_column  :restaurants, :close_time_minute , :integer
  end
end
