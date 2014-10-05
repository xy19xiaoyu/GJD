require 'test_helper'

class GoDownsControllerTest < ActionController::TestCase
  setup do
    @go_down = go_downs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:go_downs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create go_down" do
    assert_difference('GoDown.count') do
      post :create, go_down: { Address: @go_down.Address, Admin: @go_down.Admin, GoDownId: @go_down.GoDownId, Name: @go_down.Name, Tel: @go_down.Tel }
    end

    assert_redirected_to go_down_path(assigns(:go_down))
  end

  test "should show go_down" do
    get :show, id: @go_down
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @go_down
    assert_response :success
  end

  test "should update go_down" do
    patch :update, id: @go_down, go_down: { Address: @go_down.Address, Admin: @go_down.Admin, GoDownId: @go_down.GoDownId, Name: @go_down.Name, Tel: @go_down.Tel }
    assert_redirected_to go_down_path(assigns(:go_down))
  end

  test "should destroy go_down" do
    assert_difference('GoDown.count', -1) do
      delete :destroy, id: @go_down
    end

    assert_redirected_to go_downs_path
  end
end
