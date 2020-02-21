require 'test_helper'

class ModifysubjectControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get modifysubject_index_url
    assert_response :success
  end

  test "should get new" do
    get modifysubject_new_url
    assert_response :success
  end

  test "should get create" do
    get modifysubject_create_url
    assert_response :success
  end

  test "should get destroy" do
    get modifysubject_destroy_url
    assert_response :success
  end

end
