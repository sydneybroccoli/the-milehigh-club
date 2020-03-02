require 'test_helper'

class AircraftsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aircrafts_index_url
    assert_response :success
  end

  test "should get show" do
    get aircrafts_show_url
    assert_response :success
  end

  test "should get new" do
    get aircrafts_new_url
    assert_response :success
  end

  test "should get create" do
    get aircrafts_create_url
    assert_response :success
  end

  test "should get edit" do
    get aircrafts_edit_url
    assert_response :success
  end

  test "should get update" do
    get aircrafts_update_url
    assert_response :success
  end

  test "should get delete" do
    get aircrafts_delete_url
    assert_response :success
  end

end
