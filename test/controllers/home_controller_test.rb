require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get crw" do
    get :crw
    assert_response :success
  end

end
