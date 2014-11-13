require 'test_helper'

class Info::CustomersControllerTest < ActionController::TestCase
  setup do
    @info_customer = info_customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:info_customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create info_customer" do
    assert_difference('Info::Customer.count') do
      post :create, info_customer: { address: @info_customer.address, alarmMoney: @info_customer.alarmMoney, bank: @info_customer.bank, bankAccountName: @info_customer.bankAccountName, bankAccountNum: @info_customer.bankAccountNum, cid: @info_customer.cid, contact: @info_customer.contact, deposit: @info_customer.deposit, email: @info_customer.email, fax: @info_customer.fax, lower_id: @info_customer.lower_id, name: @info_customer.name, payType: @info_customer.payType, rebateFlag: @info_customer.rebateFlag, shortName: @info_customer.shortName, tel: @info_customer.tel, upper_id: @info_customer.upper_id, zip: @info_customer.zip }
    end

    assert_redirected_to info_customer_path(assigns(:info_customer))
  end

  test "should show info_customer" do
    get :show, id: @info_customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @info_customer
    assert_response :success
  end

  test "should update info_customer" do
    patch :update, id: @info_customer, info_customer: { address: @info_customer.address, alarmMoney: @info_customer.alarmMoney, bank: @info_customer.bank, bankAccountName: @info_customer.bankAccountName, bankAccountNum: @info_customer.bankAccountNum, cid: @info_customer.cid, contact: @info_customer.contact, deposit: @info_customer.deposit, email: @info_customer.email, fax: @info_customer.fax, lower_id: @info_customer.lower_id, name: @info_customer.name, payType: @info_customer.payType, rebateFlag: @info_customer.rebateFlag, shortName: @info_customer.shortName, tel: @info_customer.tel, upper_id: @info_customer.upper_id, zip: @info_customer.zip }
    assert_redirected_to info_customer_path(assigns(:info_customer))
  end

  test "should destroy info_customer" do
    assert_difference('Info::Customer.count', -1) do
      delete :destroy, id: @info_customer
    end

    assert_redirected_to info_customers_path
  end
end
