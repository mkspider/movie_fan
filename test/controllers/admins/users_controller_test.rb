require "test_helper"

class Admins::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_users_index_url
    assert_response :success
  end

  test "should get delete" do
    get admins_users_delete_url
    assert_response :success
  end
end
