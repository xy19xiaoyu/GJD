require 'test_helper'

class GoDownItemsControllerTest < ActionController::TestCase
  setup do
    @go_down_item = go_down_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:go_down_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create go_down_item" do
    assert_difference('GoDownItem.count') do
      post :create, go_down_item: { BatchId: @go_down_item.BatchId, CreateTime: @go_down_item.CreateTime, Execer: @go_down_item.Execer, GoDowinId: @go_down_item.GoDowinId, InTime: @go_down_item.InTime, Item_id: @go_down_item.Item_id, MadeIn: @go_down_item.MadeIn, Order_id: @go_down_item.Order_id, ShelfLife: @go_down_item.ShelfLife, State: @go_down_item.State, Sum: @go_down_item.Sum }
    end

    assert_redirected_to go_down_item_path(assigns(:go_down_item))
  end

  test "should show go_down_item" do
    get :show, id: @go_down_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @go_down_item
    assert_response :success
  end

  test "should update go_down_item" do
    patch :update, id: @go_down_item, go_down_item: { BatchId: @go_down_item.BatchId, CreateTime: @go_down_item.CreateTime, Execer: @go_down_item.Execer, GoDowinId: @go_down_item.GoDowinId, InTime: @go_down_item.InTime, Item_id: @go_down_item.Item_id, MadeIn: @go_down_item.MadeIn, Order_id: @go_down_item.Order_id, ShelfLife: @go_down_item.ShelfLife, State: @go_down_item.State, Sum: @go_down_item.Sum }
    assert_redirected_to go_down_item_path(assigns(:go_down_item))
  end

  test "should destroy go_down_item" do
    assert_difference('GoDownItem.count', -1) do
      delete :destroy, id: @go_down_item
    end

    assert_redirected_to go_down_items_path
  end
end
