class StaticPagesController < ApplicationController
  def home
    @num =rand(10)
  end

  def help
    redirect_to :back
  end

  def page_403

  end
end
