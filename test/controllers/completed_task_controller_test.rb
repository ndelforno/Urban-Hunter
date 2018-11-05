require 'test_helper'

class CompletedTaskControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get completed_task_index_url
    assert_response :success
  end

  test "should get new" do
    get completed_task_new_url
    assert_response :success
  end

  test "should get create" do
    get completed_task_create_url
    assert_response :success
  end

  test "should get edit" do
    get completed_task_edit_url
    assert_response :success
  end

  test "should get update" do
    get completed_task_update_url
    assert_response :success
  end

  test "should get delete" do
    get completed_task_delete_url
    assert_response :success
  end

end
