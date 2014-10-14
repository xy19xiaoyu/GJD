# encoding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authorize
  protect_from_forgery with: :exception

  protected
  def authorize
    unless !CC_LOGIN_ENABLE || User.find_by_id(session[:user_id])
      redirect_to login_url, :notice => '请登录'
    end
  end
end