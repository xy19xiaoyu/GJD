class GoDownItemsController < ApplicationController
  before_action :set_go_down_item, only: [:show, :edit, :update, :destroy]

  # GET /go_down_items
  # GET /go_down_items.json
  def index
    @go_down_items = GoDownItem.all
  end

  # GET /go_down_items/1
  # GET /go_down_items/1.json
  def show
  end

  # GET /go_down_items/new
  def new
    @go_down_item = GoDownItem.new
  end

  # GET /go_down_items/1/edit
  def edit
  end

  # POST /go_down_items
  # POST /go_down_items.json
  def create
    @go_down_item = GoDownItem.new(go_down_item_params)

    respond_to do |format|
      if @go_down_item.save
        format.html { redirect_to @go_down_item, notice: 'Go down item was successfully created.' }
        format.json { render :show, status: :created, location: @go_down_item }
      else
        format.html { render :new }
        format.json { render json: @go_down_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /go_down_items/1
  # PATCH/PUT /go_down_items/1.json
  def update
    respond_to do |format|
      if @go_down_item.update(go_down_item_params)
        format.html { redirect_to @go_down_item, notice: 'Go down item was successfully updated.' }
        format.json { render :show, status: :ok, location: @go_down_item }
      else
        format.html { render :edit }
        format.json { render json: @go_down_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /go_down_items/1
  # DELETE /go_down_items/1.json
  def destroy
    @go_down_item.destroy
    respond_to do |format|
      format.html { redirect_to go_down_items_url, notice: 'Go down item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @group =GoDownItem.all.group(:Item_id).sum(:Sum)
    respond_to do |format|
      format.json { render :json => @group }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_go_down_item
    @go_down_item = GoDownItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def go_down_item_params
    params.require(:go_down_item).permit(:Order_id, :GoDown_id, :Item_id, :CreateTime, :ShelfLife, :Sum, :BatchId, :MadeIn, :InTime, :Execer, :State)
  end
end
