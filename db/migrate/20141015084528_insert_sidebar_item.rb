# encoding: utf-8
class InsertSidebarItem < ActiveRecord::Migration
  def change

    site = Origin::Site.first
    site = Origin::Site.new unless site
    site.title = '管家爹' unless site.title

    if (site.sidebar_items.empty?)
      site.sidebar_items.build(name: '管家爹控制台', url: '/')

      peizhi_item = site.sidebar_items.build(name: '配置管理', url: '#')
      peizhi_item.sub_items.build(name: '品目配置', url: '/categories')
      peizhi_item.sub_items.build(name: '物品配置', url: '/items')
      peizhi_item.sub_items.build(name: '仓库配置', url: '/go_downs')
      peizhi_item.sub_items.build(name: '生产流水配置', url: '/batches')

      dingdan_item = site.sidebar_items.build(name: '订单管理', url: '#')
      dingdan_item.sub_items.build(name: '采购订单', url:'/orders/?type=1')
      dingdan_item.sub_items.build(name: '采购订单1', url:'/purchase_orders')
      dingdan_item.sub_items.build(name: '销售订单', url:'/o_orders')
      dingdan_item.sub_items.build(name: '采购订单1', url:'/sale_orders')

      cangku_item = site.sidebar_items.build(name: '仓库管理', url: '#')
      cangku_item.sub_items.build(name: '入库管理', url:'/in_orders')
      cangku_item.sub_items.build(name: '出库管理', url:'/out_orders')
      cangku_item.sub_items.build(name: '库存查询', url:'/go_down_items')

      xitong_item = site.sidebar_items.build(name: '系统管理', url: '#')
      xitong_item.sub_items.build(name: '用户管理', url:'/origin/users')
    end
    site.save
  end
end
