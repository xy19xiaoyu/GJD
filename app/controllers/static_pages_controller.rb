class StaticPagesController < ApplicationController
  def home
    a = Info::Customer.new
    a.put_session
    a.his.build.save
    @num =rand(10)
  end

  def help
    redirect_to :back
  end

  def page_403

  end
end
