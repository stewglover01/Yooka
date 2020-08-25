require 'test_helper'

class JourneysControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get journeys_show_url
    assert_response :success
  end

end
