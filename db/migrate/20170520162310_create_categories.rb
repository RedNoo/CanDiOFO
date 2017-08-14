class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.int :line_no
      t.references :restaurant

      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
