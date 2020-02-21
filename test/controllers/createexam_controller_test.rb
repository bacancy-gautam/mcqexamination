require 'test_helper'

class CreateexamControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get createexam_index_url
    assert_response :success
  end

  test "should get new" do
    get createexam_new_url
    assert_response :success
  end

  test "should get create" do
    get createexam_create_url
    assert_response :success
  end

  test "should get show" do
    get createexam_show_url
    assert_response :success
  end

  test "should get edit" do
    get createexam_edit_url
    assert_response :success
  end

  test "should get update" do
    get createexam_update_url
    assert_response :success
  end

  test "should get destroy" do
    get createexam_destroy_url
    assert_response :success
  end

end
