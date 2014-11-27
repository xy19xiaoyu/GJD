class BaseOrder < ActiveRecord::Base
  has_many :order_items,:foreign_key=> "BaseOrder_id"
  has_many :order_item_his
  has_many :billhis
  has_many :in_orders,:foreign_key => "Order_id"
end
