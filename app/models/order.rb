class Order < ActiveRecord::Base
  has_many :sub_orders
  has_many :in_orders
end
