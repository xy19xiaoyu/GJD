# encoding: utf-8
class Origin::SessionsController < ApplicationController
  skip_before_filter :authorize
  layout 'login', :only => :new

  def new
  end

  def create
    if user = Origin::User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to home_url
    else
      redirect_to origin_login_url, :alert => '用户名密码不正确'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_url, :notice => '您已经成功登出'
  end
end
