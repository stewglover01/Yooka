require 'test_helper'

class MoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get checkin" do
    get moods_checkin_url
    assert_response :success
  end

  test "should get checkin2" do
    get moods_checkin2_url
    assert_response :success
  end

end
