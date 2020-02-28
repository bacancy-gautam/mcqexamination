require 'test_helper'

class AddquestionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get addquestion_index_url
    assert_response :success
  end

  test "should get new" do
    get addquestion_new_url
    assert_response :success
  end

  test "should get show" do
    get addquestion_show_url
    assert_response :success
  end

  test "should get edit" do
    get addquestion_edit_url
    assert_response :success
  end

  test "should get update" do
    get addquestion_update_url
    assert_response :success
  end

  test "should get destroy" do
    get addquestion_destroy_url
    assert_response :success
  end

end
