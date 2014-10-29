# encoding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authorize
  protect_from_forgery with: :exception

  protected
  def authorize
    user = Origin::User.find_by_id(session[:user_id])
    unless !CC_LOGIN_ENABLE || user
      redirect_to origin_login_url, :notice => '请登录'
      return
    end

    return if params[:controller].include?('static_pages')

    user.sidebar_items.each do |item|
      return if item.url.include?(params[:controller])
    end
    redirect_to static_pages_403_path
  end
end