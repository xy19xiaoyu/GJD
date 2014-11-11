#encoding: utf-8
class AddSysSideBar < ActiveRecord::Migration
  def up
    item = Origin::SidebarItem.find_by_name('系统管理').sub_items.build(:name => '角色管理', :url => '/origin/roles')
    item.save
    item = Origin::SidebarItem.find_by_name('系统管理').sub_items.build(:name => '菜单项管理', :url => '/origin/sidebar_items')
    item.save
  end
end
