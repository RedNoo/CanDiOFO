class Cartproduct  < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  attr_accessor :restaurant_id
end
