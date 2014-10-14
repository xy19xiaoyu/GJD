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
    @sub_orders = SubOrder.where(:Order_id => @o_order.id)
  end

  # GET /o_orders/new
  def new
    @o_order = OOrder.new
  end

  # GET /o_orders/1/edit
  def edit
    @sub_orders = @o_order.sub_orders
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
            @sub_order =SubOrder.new(:Item_id => @tmp[:Item_id], :Sum => @tmp[:Sum], :GoDown_id => @tmp[:GoDown_id])
            @sub_order.Order_id= @o_order.id
            @sub_order.save
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
        for x in 1..@o_order.sub_orders.count
          @tmp = params.require("itemline#{x}").permit(:id, :Item_id, :Sum)
          if (@tmp[:id] !="")
            puts @tmp
            @sub_order =SubOrder.find(@tmp[:id])
            @sub_order.update(@tmp)
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
    @i =1;
    @gdids = @o_order.sub_orders.select(:GoDown_id).map(&:GoDown_id).uniq
    puts @gdids.count
    @order.sub_orders.select(:GoDown_id).map(&:GoDown_id).uniq.each do |gdid|
      puts "gdid:#{gdid}"
      @OutOrder = OutOrder.new()
      @OutOrder.OutOrderId = "#{@order.OrderId}_#{@i.to_s}"
      @OutOrder.GoDown_id = gdid
      @OutOrder.Type= @order.Type
      @OutOrder.Order_id = @order.id
      @OutOrder.State = "新建"
      @OutOrder.save();
      @i = @i+1
    end

    if @order.Type=="1"
      @order.update(:State => "待入库")
      redirect_to "/in_orders/#{@order.id}"

    else
      @order.update(:State => "待出库")
      redirect_to "/out_orders/#{@order.id}"
    end

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
