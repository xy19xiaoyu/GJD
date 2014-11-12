class Info::ProvidersController < ApplicationController
  before_action :set_info_provider, only: [:show, :edit, :update, :destroy, :show_finance]

  # GET /info/providers
  # GET /info/providers.json
  def index
    @info_providers = Info::Provider.all
  end

  # GET /info/providers/1
  # GET /info/providers/1.json
  def show
  end

  # GET /info/providers/new
  def new
    @info_provider = Info::Provider.new
  end

  # GET /info/providers/1/edit
  def edit
  end

  # POST /info/providers
  # POST /info/providers.json
  def create
    @info_provider = Info::Provider.new(info_provider_params)

    respond_to do |format|
      if @info_provider.save
        format.html { redirect_to @info_provider, notice: 'Provider was successfully created.' }
        format.json { render :show, status: :created, location: @info_provider }
      else
        format.html { render :new }
        format.json { render json: @info_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /info/providers/1
  # PATCH/PUT /info/providers/1.json
  def update
    respond_to do |format|
      if @info_provider.update(info_provider_params)
        format.html { redirect_to @info_provider, notice: 'Provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @info_provider }
      else
        format.html { render :edit }
        format.json { render json: @info_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /info/providers/1
  # DELETE /info/providers/1.json
  def destroy
    @info_provider.destroy
    respond_to do |format|
      format.html { redirect_to info_providers_url, notice: 'Provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_finance

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_info_provider
    @info_provider = Info::Provider.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def info_provider_params
    params.require(:info_provider).permit(:cid, :shortName, :name, :contact, :email, :tel, :mobile_tel, :fax, :address, :zip, :bank, :bankAccountNum, :bankAccountName, :deposit, :alarmMoney, :payType, :rebateFlag, :upper_id, :lower_id, :finance_id)
  end
end
