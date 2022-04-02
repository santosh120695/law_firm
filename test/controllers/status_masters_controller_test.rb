require "test_helper"

class StatusMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_master = status_masters(:one)
  end

  test "should get index" do
    get status_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_status_master_url
    assert_response :success
  end

  test "should create status_master" do
    assert_difference("StatusMaster.count") do
      post status_masters_url, params: { status_master: { active: @status_master.active, color: @status_master.color, name: @status_master.name, uuid: @status_master.uuid } }
    end

    assert_redirected_to status_master_url(StatusMaster.last)
  end

  test "should show status_master" do
    get status_master_url(@status_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_status_master_url(@status_master)
    assert_response :success
  end

  test "should update status_master" do
    patch status_master_url(@status_master), params: { status_master: { active: @status_master.active, color: @status_master.color, name: @status_master.name, uuid: @status_master.uuid } }
    assert_redirected_to status_master_url(@status_master)
  end

  test "should destroy status_master" do
    assert_difference("StatusMaster.count", -1) do
      delete status_master_url(@status_master)
    end

    assert_redirected_to status_masters_url
  end
end
