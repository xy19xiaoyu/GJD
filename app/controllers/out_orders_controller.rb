# encoding: utf-8
class OutOrdersController < ApplicationController

  # GET /out_orders
  # GET /out_orders.json
  def index
    @Orders =  Order.where(:State=>"待出库")
  end

  # GET /out_orders/1
  # GET /out_orders/1.json
  def show
    puts params
    @orderid = params[:id]
    @order = Order.find(@orderid)
    @out_orders = OutOrder.where(:Order_id => @orderid)
    @gds = @out_orders.select(:GoDown_id).map(&:GoDown_id).uniq
  end

  # GET /out_orders/new
  def new
    @out_order = OutOrder.new
  end

  # GET /out_orders/1/edit
  def edit
  end

  # POST /out_orders
  # POST /out_orders.json
  def create
    @out_order = OutOrder.new(out_order_params)

    respond_to do |format|
      if @out_order.save
        format.html { redirect_to @out_order, notice: 'Out order was successfully created.' }
        format.json { render :show, status: :created, location: @out_order }
      else
        format.html { render :new }
        format.json { render json: @out_order.errors, status: :unprocessable_entity }
      end
    end
  end
  def exec
    @outorderid = params[:id]
    @out_order = OutOrder.find(@outorderid)
    @order = Order.find(@out_order.Order_id)
    @gd = GoDown.find(@out_order.GoDown_id)
    @sub_orders = SubOrder.where(:Order_id => @order.id,:GoDown_id => @gd.id)
  end

  # POST /in_orders
  # POST /in_orders.json
  def ingodown
    puts params
    @outorder = Outorder.find(params.require(:out_order).permit(:id)[:id])
    @itemcount =params.require(:items).permit(:count)[:count]
    for x in 1..@itemcount.to_i
      @tmp = params.require("itemline#{x}").permit(:Item_id, :Sum, :BatchId, :CreateTime ,:ShelfLife, :MadeIn)
      if(@tmp[:Item_id] !="")
        puts @tmp
        #@godownitem =GoDownItem.new(:Item_id=>@tmp[:Item_id],:Sum=>@tmp[:Sum],:GoDown_id=>@outorder.GoDown_id,:CreateTime=>@tmp[:CreateTime],:ShelfLife=>@tmp[:ShelLeft],:MadeIn=>@tmp[:MadIn])
        #@godownitem.Execer = "陈晓雨"
        #@godownitem.State = "入库"
        #@godownitem.InTime =Time.new.strftime("%Y-%m-%d %H:%M:%S")
        #@godownitem.save
      end
    end
    @outorder.update(:State=>"已执行",:Execer=>"陈晓雨", :ExecTime=>Time.new.strftime("%Y-%m-%d %H:%M:%S"))
    redirect_to "/in_orders/"

  end

  # PATCH/PUT /out_orders/1
  # PATCH/PUT /out_orders/1.json
  def update
    respond_to do |format|
      if @out_order.update(out_order_params)
        format.html { redirect_to @out_order, notice: 'Out order was successfully updated.' }
        format.json { render :show, status: :ok, location: @out_order }
      else
        format.html { render :edit }
        format.json { render json: @out_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /out_orders/1
  # DELETE /out_orders/1.json
  def destroy
    @out_order.destroy
    respond_to do |format|
      format.html { redirect_to out_orders_url, notice: 'Out order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_out_order
      @out_order = OutOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def out_order_params
      params.require(:out_order).permit(:Order_id, :GoDown_id, :OutOrderId, :Name, :Type, :CreateTime, :CreateUser, :ExecTime, :Execer, :State)
    end
end
