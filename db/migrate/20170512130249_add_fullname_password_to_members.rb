class AddFullnamePasswordToMembers < ActiveRecord::Migration
  def change
    add_column :members, :full_name, :string
    add_column :members, :password_digest, :string
  end
end
