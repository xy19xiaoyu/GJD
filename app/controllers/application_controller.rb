# encoding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :origin_init, :authorize
  protect_from_forgery with: :exception

  protected

  def origin_init
    Origin::Site.new.save if Origin::Site.all.empty?
  end

  def authorize
    unless !CC_LOGIN_ENABLE || Origin::User.find_by_id(session[:user_id])
      redirect_to origin_login_path, :notice => '请登录'
    end
  end
end