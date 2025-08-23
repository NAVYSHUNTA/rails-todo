require "test_helper"

class SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get edit_setting_url
    assert_response :success
  end

  test "should get update" do
    patch setting_url, params: { setting: { default_deadline_days: 1 } }
    assert_redirected_to todos_url
  end
end
