# encoding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to home_url
    else
      redirect_to login_url, :alert => '用户名密码不正确'
    end
  end

  def destroy
  end
end