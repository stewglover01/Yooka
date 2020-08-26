require 'test_helper'

class VideosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get videos_show_url
    assert_response :success
  end

end
