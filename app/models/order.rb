class Order  < ActiveRecord::Base
  belongs_to :cart
  belongs_to :member
  belongs_to :restaurant
  has_many :order_roducts

  
end
