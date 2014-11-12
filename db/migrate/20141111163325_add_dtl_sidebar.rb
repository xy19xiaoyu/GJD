#encoding: utf-8
class AddDtlSidebar < ActiveRecord::Migration
  def up
    item = Origin::SidebarItem.find_by_name('资料管理')
    item.destroy if item

    item = Origin::SidebarItem.find_or_create_by(:name => '客户管理')
    item.url = '#'
    item.site_id = 1
    item.save

    item.sub_items.build({:name => '客户资料管理', :url => '/info/customers'}).save
    item.sub_items.build({:name => '客户出入账管理', :url => '/info/customer_fin_dtls'}).save
  end

  def down

  end
end
