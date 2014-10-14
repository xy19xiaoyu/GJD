require 'test_helper'

class OOrdersControllerTest < ActionController::TestCase
  setup do
    @o_order = o_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:o_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create o_order" do
    assert_difference('OOrder.count') do
      post :create, o_order: { Address: @o_order.Address, CreateTime: @o_order.CreateTime, CreateUser: @o_order.CreateUser, Customer: @o_order.Customer, ExecTime: @o_order.ExecTime, Execer: @o_order.Execer, Name: @o_order.Name, OrderId: @o_order.OrderId, State: @o_order.State, Type: @o_order.Type }
    end

    assert_redirected_to o_order_path(assigns(:o_order))
  end

  test "should show o_order" do
    get :show, id: @o_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @o_order
    assert_response :success
  end

  test "should update o_order" do
    patch :update, id: @o_order, o_order: { Address: @o_order.Address, CreateTime: @o_order.CreateTime, CreateUser: @o_order.CreateUser, Customer: @o_order.Customer, ExecTime: @o_order.ExecTime, Execer: @o_order.Execer, Name: @o_order.Name, OrderId: @o_order.OrderId, State: @o_order.State, Type: @o_order.Type }
    assert_redirected_to o_order_path(assigns(:o_order))
  end

  test "should destroy o_order" do
    assert_difference('OOrder.count', -1) do
      delete :destroy, id: @o_order
    end

    assert_redirected_to o_orders_path
  end
end
