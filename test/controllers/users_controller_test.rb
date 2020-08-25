require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get users_home_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get social" do
    get users_social_url
    assert_response :success
  end

  test "should get tools" do
    get users_tools_url
    assert_response :success
  end

  test "should get support" do
    get users_support_url
    assert_response :success
  end

end
