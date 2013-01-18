require 'test_helper'

class InfoControllerTest < ActionController::TestCase
  test "should get intro" do
    get :intro
    assert_response :success
  end

  test "should get historia" do
    get :historia
    assert_response :success
  end

  test "should get contactenos" do
    get :contactenos
    assert_response :success
  end

end
