class CreateCuisines < ActiveRecord::Migration
  def change
    create_table :cuisines do |t|
      t.string :title


      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
