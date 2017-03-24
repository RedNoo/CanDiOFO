class RemovePostCodeFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :post_code
    remove_column :users, :lat
    remove_column :users, :lng
  end
end
