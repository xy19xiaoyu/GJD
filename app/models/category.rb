# encoding: utf-8
class Category < ActiveRecord::Base
  validates_presence_of :Name, :message => "品目名称不能为空"
  validates_uniqueness_of :Name, :message => "品目名称已存在"
end
