require 'test_helper'

class MakeAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get make_admin_new_url
    assert_response :success
  end

  test "should get create" do
    get make_admin_create_url
    assert_response :success
  end

  test "should get destroy" do
    get make_admin_destroy_url
    assert_response :success
  end

end
