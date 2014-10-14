class Origin::SidebarItem < ActiveRecord::Base
  belongs_to :site, :class_name => 'Origin::Site', foreign_key: :site_id
  belongs_to :parent_item, :class_name => 'Origin::SidebarItem', foreign_key: :parent_id
  has_many :sub_item, :class_name => 'Origin::SidebarItem', foreign_key: :parent_id, :dependent => :destroy
end
