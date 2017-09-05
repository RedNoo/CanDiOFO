class AddPostCodeToMembers < ActiveRecord::Migration
  def change
    add_column :members, :post_code, :string
  end
end
