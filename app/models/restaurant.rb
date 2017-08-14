class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :restaurant_cuisines
  has_many :cuisines , :through => :restaurant_cuisines

end
