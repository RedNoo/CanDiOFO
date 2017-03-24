class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :password_digest
      t.string :post_code
      t.float :lat
      t.float :lng

      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
