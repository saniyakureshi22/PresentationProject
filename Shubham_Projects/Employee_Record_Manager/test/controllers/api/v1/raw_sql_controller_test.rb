require "test_helper"

class Api::V1::RawSqlControllerTest < ActionDispatch::IntegrationTest
  test "should get select_all" do
    get api_v1_raw_sql_select_all_url
    assert_response :success
  end

  test "should get select_where" do
    get api_v1_raw_sql_select_where_url
    assert_response :success
  end

  test "should get insert" do
    get api_v1_raw_sql_insert_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_raw_sql_update_url
    assert_response :success
  end

  test "should get delete" do
    get api_v1_raw_sql_delete_url
    assert_response :success
  end
end
