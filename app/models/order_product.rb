class OrderProduct  < ActiveRecord::Base
  belongs_to :order
  belongs_to :cart
  belongs_to :order

end
