require 'test_helper'

class ViewersControllerTest < ActionController::TestCase
  test "should get lock" do
    get :lock
    assert_response :success
  end

  test "should get preview" do
    get :preview
    assert_response :success
  end

end
