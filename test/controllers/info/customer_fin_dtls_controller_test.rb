require 'test_helper'

class Info::CustomerFinDtlsControllerTest < ActionController::TestCase
  setup do
    @info_customer_fin_dtl = info_customer_fin_dtls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:info_customer_fin_dtls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create info_customer_fin_dtl" do
    assert_difference('Info::CustomerFinDtl.count') do
      post :create, info_customer_fin_dtl: { cfd_id: @info_customer_fin_dtl.cfd_id, customer_fin_id: @info_customer_fin_dtl.customer_fin_id, do_time: @info_customer_fin_dtl.do_time, in_or_out: @info_customer_fin_dtl.in_or_out, money: @info_customer_fin_dtl.money, status_id: @info_customer_fin_dtl.status_id }
    end

    assert_redirected_to info_customer_fin_dtl_path(assigns(:info_customer_fin_dtl))
  end

  test "should show info_customer_fin_dtl" do
    get :show, id: @info_customer_fin_dtl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @info_customer_fin_dtl
    assert_response :success
  end

  test "should update info_customer_fin_dtl" do
    patch :update, id: @info_customer_fin_dtl, info_customer_fin_dtl: { cfd_id: @info_customer_fin_dtl.cfd_id, customer_fin_id: @info_customer_fin_dtl.customer_fin_id, do_time: @info_customer_fin_dtl.do_time, in_or_out: @info_customer_fin_dtl.in_or_out, money: @info_customer_fin_dtl.money, status_id: @info_customer_fin_dtl.status_id }
    assert_redirected_to info_customer_fin_dtl_path(assigns(:info_customer_fin_dtl))
  end

  test "should destroy info_customer_fin_dtl" do
    assert_difference('Info::CustomerFinDtl.count', -1) do
      delete :destroy, id: @info_customer_fin_dtl
    end

    assert_redirected_to info_customer_fin_dtls_path
  end
end
