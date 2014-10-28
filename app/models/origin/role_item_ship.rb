class Origin::RoleItemShip < ActiveRecord::Base
  belongs_to :role, :class_name => 'Origin::Role'
  belongs_to :sidebar_item, :class_name => 'Origin::SidebarItem'
end
