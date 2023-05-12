require "test_helper"

class ScreenshotControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get screenshot_index_url
    assert_response :success
  end

  test "should get capture" do
    get screenshot_capture_url
    assert_response :success
  end
end
