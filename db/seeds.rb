#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#  在这里可以做系统部署数据初始化
# e.g.: 创建管理员用户、初始化权限、基本信息配置
#删除所有用户
#User.delete_all
#admin= User.Create([{name: 'admin'}])
#Category.delete_all
#caretegories = Category.Create([{Name: "", Type: ""}])

# 添加供应商
Info::Provider.delete_all
x = Info::Provider.new
x.name="李靖超"
x.save()

# 添加仓库信息
GoDown.delete_all
g = GoDown.new
g.Name = "海淀一号"
g.Address = "大柳树北路17号"
g.Admin = "陈晓雨"
g.Tel = "18612345678"
g.save()

#添加品目信息
#添加品目规格
#添加物品信息
