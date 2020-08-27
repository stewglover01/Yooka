require 'test_helper'

class JourneyHabitsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get journey_habits_create_url
    assert_response :success
  end

end
