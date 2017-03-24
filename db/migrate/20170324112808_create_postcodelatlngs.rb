class CreatePostcodelatlngs < ActiveRecord::Migration
  def change
    create_table :postcodelatlngs do |t|

      t.string :postcode
      t.float :latitude
      t.float :longitude

      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
