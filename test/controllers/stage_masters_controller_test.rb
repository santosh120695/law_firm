require "test_helper"

class StageMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stage_master = stage_masters(:one)
  end

  test "should get index" do
    get stage_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_stage_master_url
    assert_response :success
  end

  test "should create stage_master" do
    assert_difference("StageMaster.count") do
      post stage_masters_url, params: { stage_master: { name: @stage_master.name } }
    end

    assert_redirected_to stage_master_url(StageMaster.last)
  end

  test "should show stage_master" do
    get stage_master_url(@stage_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_stage_master_url(@stage_master)
    assert_response :success
  end

  test "should update stage_master" do
    patch stage_master_url(@stage_master), params: { stage_master: { name: @stage_master.name } }
    assert_redirected_to stage_master_url(@stage_master)
  end

  test "should destroy stage_master" do
    assert_difference("StageMaster.count", -1) do
      delete stage_master_url(@stage_master)
    end

    assert_redirected_to stage_masters_url
  end
end
