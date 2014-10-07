require 'test_helper'

class SubOrdersControllerTest < ActionController::TestCase
  setup do
    @sub_order = sub_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_order" do
    assert_difference('SubOrder.count') do
      post :create, sub_order: { BatchId: @sub_order.BatchId, CreateTime: @sub_order.CreateTime, ItemNo: @sub_order.ItemNo, MadeIn: @sub_order.MadeIn, OrderId: @sub_order.OrderId, ShelfLife: @sub_order.ShelfLife, Sum1: @sub_order.Sum1, Sum: @sub_order.Sum }
    end

    assert_redirected_to sub_order_path(assigns(:sub_order))
  end

  test "should show sub_order" do
    get :show, id: @sub_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_order
    assert_response :success
  end

  test "should update sub_order" do
    patch :update, id: @sub_order, sub_order: { BatchId: @sub_order.BatchId, CreateTime: @sub_order.CreateTime, ItemNo: @sub_order.ItemNo, MadeIn: @sub_order.MadeIn, OrderId: @sub_order.OrderId, ShelfLife: @sub_order.ShelfLife, Sum1: @sub_order.Sum1, Sum: @sub_order.Sum }
    assert_redirected_to sub_order_path(assigns(:sub_order))
  end

  test "should destroy sub_order" do
    assert_difference('SubOrder.count', -1) do
      delete :destroy, id: @sub_order
    end

    assert_redirected_to sub_orders_path
  end
end
