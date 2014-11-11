class Info::CustomerFinDtlsController < ApplicationController
  before_action :set_info_customer_fin_dtl, only: [:show, :edit, :update, :destroy]

  # GET /info/customer_fin_dtls
  # GET /info/customer_fin_dtls.json
  def index
    @info_customer_fin_dtls = Info::CustomerFinDtl.all
  end

  # GET /info/customer_fin_dtls/1
  # GET /info/customer_fin_dtls/1.json
  def show
  end

  # GET /info/customer_fin_dtls/new
  def new
    @info_customer_fin_dtl = Info::CustomerFinDtl.new
  end

  # GET /info/customer_fin_dtls/1/edit
  def edit
  end

  # POST /info/customer_fin_dtls
  # POST /info/customer_fin_dtls.json
  def create
    @info_customer_fin_dtl = Info::CustomerFinDtl.new(info_customer_fin_dtl_params)

    respond_to do |format|
      if @info_customer_fin_dtl.save
        format.html { redirect_to @info_customer_fin_dtl, notice: 'Customer fin dtl was successfully created.' }
        format.json { render :show, status: :created, location: @info_customer_fin_dtl }
      else
        format.html { render :new }
        format.json { render json: @info_customer_fin_dtl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /info/customer_fin_dtls/1
  # PATCH/PUT /info/customer_fin_dtls/1.json
  def update
    respond_to do |format|
      if @info_customer_fin_dtl.update(info_customer_fin_dtl_params)
        format.html { redirect_to @info_customer_fin_dtl, notice: 'Customer fin dtl was successfully updated.' }
        format.json { render :show, status: :ok, location: @info_customer_fin_dtl }
      else
        format.html { render :edit }
        format.json { render json: @info_customer_fin_dtl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /info/customer_fin_dtls/1
  # DELETE /info/customer_fin_dtls/1.json
  def destroy
    @info_customer_fin_dtl.destroy
    respond_to do |format|
      format.html { redirect_to info_customer_fin_dtls_url, notice: 'Customer fin dtl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info_customer_fin_dtl
      @info_customer_fin_dtl = Info::CustomerFinDtl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_customer_fin_dtl_params
      params.require(:info_customer_fin_dtl).permit(:customer_fin_id, :do_time, :in_or_out, :money, :cfd_id, :status_id)
    end
end
