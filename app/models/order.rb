class Order < ActiveRecord::Base
  has_many :sub_orders
end
