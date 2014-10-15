# encoding: utf-8
require 'digest/sha2'

class Origin::User < ActiveRecord::Base
  validate :name, :presence => true, :uniqueness => true
  validate :password, :presence => true
  validates_confirmation_of :password, message: '两次密码输入不一致'

  attr_reader :password
  validate :password_must_be_present

  after_destroy :ensure_an_admin_remains

  def self.authenticate(name, password)
    if user = find_by_name(name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  def self.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + 'asdf' + salt)
  end

  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

  private

  def password_must_be_present
    errors.add(:password, '密码不能为空') unless hashed_password.present?
  end

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def ensure_an_admin_remains
    if Origin::User.count.zero?
      raise '不能删除最后一个管理员'
    end
  end
end
