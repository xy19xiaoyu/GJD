class OOrder < ActiveRecord::Base
  has_many :o_order_items,:foreign_key=>"OOrder_id"
  has_many :out_orders,:foreign_key => "Order_id"
end
