class StaticPagesController < ApplicationController
  def home
    @num =rand(10)
  end

  def help
    render action: :home
  end

  def page_403

  end
end
