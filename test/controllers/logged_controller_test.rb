require 'test_helper'

class LoggedControllerTest < ActionController::TestCase
  test "should get download" do
    get :download
    assert_response :success
  end

  test "should get features" do
    get :features
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
