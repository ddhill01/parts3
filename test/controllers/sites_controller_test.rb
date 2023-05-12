require "test_helper"

class SitesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sites_index_url
    assert_response :success
  end

  test "should get new" do
    get sites_new_url
    assert_response :success
  end

  test "should get site_areas_by_site" do
    get sites_site_areas_by_site_url
    assert_response :success
  end

  test "should get site_rooms_by_area" do
    get sites_site_rooms_by_area_url
    assert_response :success
  end
end
