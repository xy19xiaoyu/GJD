class AddGoDownIdToSubOrder < ActiveRecord::Migration
  def change
    add_column :sub_orders, :GoDownId, :string
  end
end
