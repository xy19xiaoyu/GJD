# encoding: utf-8
class InsertTestUsers < ActiveRecord::Migration
  def change

    role = Origin::Role.find_or_create_by(name: '超级管理员') do |r|
      r.adminFlag = true
      r.save
    end

    Origin::User.find_or_create_by(name: 'admin') do |user|
      user.hashed_password = 'b38dccdaff403e93e883e12ac0decabfd3a59f77acddc375306e4e2223dcb09a'
      user.salt = '702160211035000.14183056038145636'
      user.role_id = role.id
      user.save
    end

    role = Origin::Role.find_or_create_by(name: '一般管理员') do |r|
      r.adminFlag = false
      Origin::SidebarItem.where.not(:parent_id => nil).each_with_index do |item, index|
        next if index % 2 == 0
        r.sidebar_items.push(item)
      end
      r.save
    end

    Origin::User.find_or_create_by(name: 'lee') do |user|
      user.hashed_password = '78453a624e096db5caaf0d1c1aaecc486b5ca61edccf05bdc736c8a6f8ba823e'
      user.salt = '702160181549000.9970450566573815'
      user.role_id = role.id
      user.save
    end
  end
end
