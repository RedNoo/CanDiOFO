class Cart  < ActiveRecord::Base
  belongs_to :member
  belongs_to :restaurant
  has_many :cartproducts

  attr_accessor :product_id
end
