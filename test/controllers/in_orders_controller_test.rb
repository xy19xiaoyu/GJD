require 'test_helper'

class InOrdersControllerTest < ActionController::TestCase
  setup do
    @in_order = in_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:in_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create in_order" do
    assert_difference('InOrder.count') do
      post :create, in_order: { CreateTime: @in_order.CreateTime, CreateUser: @in_order.CreateUser, ExecTime: @in_order.ExecTime, Execer: @in_order.Execer, GoDown_id: @in_order.GoDown_id, InOrderId: @in_order.InOrderId, Name: @in_order.Name, Order_id: @in_order.Order_id, State: @in_order.State, Type: @in_order.Type }
    end

    assert_redirected_to in_order_path(assigns(:in_order))
  end

  test "should show in_order" do
    get :show, id: @in_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @in_order
    assert_response :success
  end

  test "should update in_order" do
    patch :update, id: @in_order, in_order: { CreateTime: @in_order.CreateTime, CreateUser: @in_order.CreateUser, ExecTime: @in_order.ExecTime, Execer: @in_order.Execer, GoDown_id: @in_order.GoDown_id, InOrderId: @in_order.InOrderId, Name: @in_order.Name, Order_id: @in_order.Order_id, State: @in_order.State, Type: @in_order.Type }
    assert_redirected_to in_order_path(assigns(:in_order))
  end

  test "should destroy in_order" do
    assert_difference('InOrder.count', -1) do
      delete :destroy, id: @in_order
    end

    assert_redirected_to in_orders_path
  end
end
