class IoGoDownController < ApplicationController
  def Inlist

  end

  def Outlist

  end

  def In
      @godown = GoDown.find(params[:godownid])
      @order = Order.find(params[:orderid])
      @sub_orders = SubOrder.where(:Order_id => @order.id,:GoDown_id => @godown.id)
      @Batchs = Batch.all
  end

  def Out

  end

  def CreateIn

  end
end
