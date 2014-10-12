require 'test_helper'

class OutOrdersControllerTest < ActionController::TestCase
  setup do
    @out_order = out_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:out_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create out_order" do
    assert_difference('OutOrder.count') do
      post :create, out_order: { CreateTime: @out_order.CreateTime, CreateUser: @out_order.CreateUser, ExecTime: @out_order.ExecTime, Execer: @out_order.Execer, GoDown_id: @out_order.GoDown_id, Name: @out_order.Name, Order_id: @out_order.Order_id, OutOrderId: @out_order.OutOrderId, State: @out_order.State, Type: @out_order.Type }
    end

    assert_redirected_to out_order_path(assigns(:out_order))
  end

  test "should show out_order" do
    get :show, id: @out_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @out_order
    assert_response :success
  end

  test "should update out_order" do
    patch :update, id: @out_order, out_order: { CreateTime: @out_order.CreateTime, CreateUser: @out_order.CreateUser, ExecTime: @out_order.ExecTime, Execer: @out_order.Execer, GoDown_id: @out_order.GoDown_id, Name: @out_order.Name, Order_id: @out_order.Order_id, OutOrderId: @out_order.OutOrderId, State: @out_order.State, Type: @out_order.Type }
    assert_redirected_to out_order_path(assigns(:out_order))
  end

  test "should destroy out_order" do
    assert_difference('OutOrder.count', -1) do
      delete :destroy, id: @out_order
    end

    assert_redirected_to out_orders_path
  end
end
