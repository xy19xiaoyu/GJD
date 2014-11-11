class Info::CustomersController < ApplicationController
  before_action :set_info_customer, only: [:show, :edit, :update, :destroy]

  # GET /info/customers
  # GET /info/customers.json
  def index
    @info_customers = Info::Customer.all
  end

  # GET /info/customers/1
  # GET /info/customers/1.json
  def show
  end

  # GET /info/customers/new
  def new
    @info_customer = Info::Customer.new
  end

  # GET /info/customers/1/edit
  def edit
  end

  # POST /info/customers
  # POST /info/customers.json
  def create
    @info_customer = Info::Customer.new(info_customer_params)

    respond_to do |format|
      if @info_customer.save
        format.html { redirect_to @info_customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @info_customer }
      else
        format.html { render :new }
        format.json { render json: @info_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /info/customers/1
  # PATCH/PUT /info/customers/1.json
  def update
    respond_to do |format|
      if @info_customer.update(info_customer_params)
        format.html { redirect_to @info_customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @info_customer }
      else
        format.html { render :edit }
        format.json { render json: @info_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /info/customers/1
  # DELETE /info/customers/1.json
  def destroy
    @info_customer.destroy
    respond_to do |format|
      format.html { redirect_to info_customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info_customer
      @info_customer = Info::Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_customer_params
      params.require(:info_customer).permit(:cid, :shortName, :name, :contact, :email, :tel, :mobile_tel, :fax, :address, :zip, :bank, :bankAccountNum, :bankAccountName, :deposit, :alarmMoney, :payType, :rebateFlag, :upper_id, :lower_id, :finance_id)
    end
end
