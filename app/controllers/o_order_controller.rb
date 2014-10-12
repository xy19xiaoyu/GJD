# encoding: utf-8
class OOrderController < ApplicationController

  def index
   # @type= params[:type]
    @type=2
    @orders = Order.where(type:@type)
    puts @type
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @sub_orders = @order.sub_orders
    # @sub_orders = SubOrder.where(OrderId:@order.OrderId)
    @GoDwons = GoDown.all
    if @order.Type=="1"
      @urlName ="生成入库单"
    else
      @urlName= "生成出库单"
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
    @type= params[:type]
    @order.Type=@type
    @GoDwons = GoDown.all

  end
end
