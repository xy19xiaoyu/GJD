class OOrder < ActiveRecord::Base
  has_many :sub_orders, :foreign_key => "Order_id"
  has_many :out_orders
end
