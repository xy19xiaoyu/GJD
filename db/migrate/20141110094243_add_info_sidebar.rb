# encoding: utf-8
class AddInfoSidebar < ActiveRecord::Migration
  def up
    item = Origin::SidebarItem.new
    item.name = '资料管理'
    item.url = '#'
    item.site_id = 1
    item.save

    item.sub_items.build({:name => '客户管理', :url => '/info/customers'}).save
  end

  def down
  end
end
