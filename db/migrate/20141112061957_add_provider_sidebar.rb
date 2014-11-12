#encoding: utf-8
class AddProviderSidebar < ActiveRecord::Migration
  def up
    item = Origin::SidebarItem.find_or_create_by(:name => '供应商管理')
    item.url = '#'
    item.site_id = 1
    item.save

    item.sub_items.build({:name => '供应商信息管理', :url => '/info/providers'}).save
  end

  def down

  end
end
