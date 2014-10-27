# encoding: utf-8
class OOrdersController < ApplicationController
  before_action :set_o_order, only: [:show, :edit, :update, :destroy]

  # GET /o_orders
  # GET /o_orders.json
  def index
    @o_orders = OOrder.all
  end

  # GET /o_orders/1
  # GET /o_orders/1.json
  def show
    #@o_order_items = OOrderItem.where(:OOrder_id => @o_order.id)
    @o_order_items= @o_order.o_order_items
  end

  # GET /o_orders/new
  def new
    @o_order = OOrder.new
  end

  # GET /o_orders/1/edit
  def edit
    @o_order_items = @o_order.o_order_items
    #@o_order_items = OOrderItem.where(:OOrder_id => @o_order.id)
  end

  # POST /o_orders
  # POST /o_orders.json
  def create

    @o_order = OOrder.new(o_order_params)
    @o_order.State = "新建"
    @o_order.CreateTime= Time.new.strftime("%Y-%m-%d %H:%M:%S")
    @o_order.CreateUser ="陈晓雨"
    respond_to do |format|
      if @o_order.save

        for x in 1..10
          @tmp = params.require("itemline#{x}").permit(:Item_id, :Sum)
          if (@tmp[:Item_id] !="")
            puts @tmp
            @o_order_item =OOrderItem.new(:Item_id => @tmp[:Item_id], :Sum => @tmp[:Sum])
            @o_order_item.OOrder_id= @o_order.id
            @o_order_item.save
          end
        end

        format.html { redirect_to @o_order, notice: 'O order was successfully created.' }
        format.json { render :show, status: :created, location: @o_order }
      else
        format.html { render :new }
        format.json { render json: @o_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /o_orders/1
  # PATCH/PUT /o_orders/1.json
  def update
    respond_to do |format|
      if @o_order.update(o_order_params)
        for x in 1..@o_order.o_order_items.count
          @tmp = params.require("itemline#{x}").permit(:id, :Item_id, :Sum)
          if (@tmp[:id] !="")
            puts @tmp
            @o_order_item =OOrderItem.find(@tmp[:id])
            @o_order_item.update(@tmp)
          end
        end
        format.html { redirect_to @o_order, notice: 'O order was successfully updated.' }
        format.json { render :show, status: :ok, location: @o_order }
      else
        format.html { render :edit }
        format.json { render json: @o_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def split
    @o_order = OOrder.find(params[:id])
    @o_order_items = @o_order.o_order_items
  end

  def CreateOutOrder
    puts params
    @o_order = OOrder.find( params[:o_order_id])
    @count = params[:outordercount]
    @gods = Array.new
    @items = Array.new
    #@o_order = OOrder.find(params[:id])
    for x in 1..@count.to_i
      @tmp = params.require("outOrder#{x}").permit(:Item_Id, :BatchId, :CreateTime, :GoDown_id, :Sum)
      if @tmp[:Sum] != ""
        @gods<< @tmp[:GoDown_id]
        @items<<@tmp
      end
    end
    @i =0
    @gods.each do|godid|
      @i = @i +1
      @out_Order = OutOrder.new()
      @out_Order.Order_id =@o_order.id
      @out_Order.GoDown_id = godid
      @out_Order.OutOrderId ="#{@o_order.OrderId}_#{@i}"
      @out_Order.State = "新建"
      @out_Order.CreateTime= Time.new.strftime("%Y-%m-%d %H:%M:%S")
      @out_Order.CreateUser ="陈晓雨"

      if @out_Order.save
        @items.each do|item|
          if item[:GoDown_id] =godid
            @outorderitem = OutOrderItem.new()
            @outorderitem.OOrder_id=@o_order.id
            @outorderitem.OutOrder_id=@out_Order.id
            @outorderitem.Item_id= item[:Item_Id]
            @outorderitem.GoDown_id= item[:GoDown_id]
            @outorderitem.BatchId= item[:BatchId]
            @outorderitem.CreateTime= item[:CreateTime]
            @outorderitem.Sum= item[:Sum]
            @outorderitem.save
          end
        end
      end
    end
    @o_order.update(:State=>"待出库")
    puts @gods;
  end

  # DELETE /o_orders/1
  # DELETE /o_orders/1.json
  def destroy
    @o_order.destroy
    respond_to do |format|
      format.html { redirect_to o_orders_url, notice: 'O order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_o_order
    @o_order = OOrder.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def o_order_params
    params.require(:o_order).permit(:OrderId, :Name, :Type, :CreateTime, :CreateUser, :ExecTime, :Execer, :State, :Customer, :Address)
  end
end
