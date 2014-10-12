require 'test_helper'

class IoGoDownControllerTest < ActionController::TestCase
  test "should get In,Out" do
    get :In,Out
    assert_response :success
  end

end
