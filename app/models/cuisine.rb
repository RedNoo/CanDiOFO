class Cuisine < ActiveRecord::Base
  has_many :restaurant_cuisines
  has_many :restaurant , :through => :restaurant_cuisines
end
