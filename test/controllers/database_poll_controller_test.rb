require "test_helper"

class DatabasePollControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get database_poll_index_url
    assert_response :success
  end
end
