require "test_helper"

class BackOffice::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get back_office_dashboard_index_url
    assert_response :success
  end
end
