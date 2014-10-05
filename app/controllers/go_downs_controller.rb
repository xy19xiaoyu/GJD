class GoDownsController < ApplicationController
  before_action :set_go_down, only: [:show, :edit, :update, :destroy]

  # GET /go_downs
  # GET /go_downs.json
  def index
    @go_downs = GoDown.all
  end

  # GET /go_downs/1
  # GET /go_downs/1.json
  def show
  end

  # GET /go_downs/new
  def new
    @go_down = GoDown.new
  end

  # GET /go_downs/1/edit
  def edit
  end

  # POST /go_downs
  # POST /go_downs.json
  def create
    @go_down = GoDown.new(go_down_params)

    respond_to do |format|
      if @go_down.save
        format.html { redirect_to @go_down, notice: 'Go down was successfully created.' }
        format.json { render :show, status: :created, location: @go_down }
      else
        format.html { render :new }
        format.json { render json: @go_down.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /go_downs/1
  # PATCH/PUT /go_downs/1.json
  def update
    respond_to do |format|
      if @go_down.update(go_down_params)
        format.html { redirect_to @go_down, notice: 'Go down was successfully updated.' }
        format.json { render :show, status: :ok, location: @go_down }
      else
        format.html { render :edit }
        format.json { render json: @go_down.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /go_downs/1
  # DELETE /go_downs/1.json
  def destroy
    @go_down.destroy
    respond_to do |format|
      format.html { redirect_to go_downs_url, notice: 'Go down was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_go_down
      @go_down = GoDown.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def go_down_params
      params.require(:go_down).permit(:GoDownId, :Name, :Address, :Admin, :Tel)
    end
end
