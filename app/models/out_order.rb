class OutOrder < ActiveRecord::Base
  belongs_to :o_order
  has_many :out_order_items, :foreign_key => "OutOrder_id"
  has_many :out_order_item_hises, :foreign_key => "OutOrder_id"
end
