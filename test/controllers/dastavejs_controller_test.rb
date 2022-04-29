require "test_helper"

class DastavejsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dastavej = dastavejs(:one)
  end

  test "should get index" do
    get dastavejs_url
    assert_response :success
  end

  test "should get new" do
    get new_dastavej_url
    assert_response :success
  end

  test "should create dastavej" do
    assert_difference("Dastavej.count") do
      post dastavejs_url, params: { dastavej: { client_id: @dastavej.client_id, contact_number: @dastavej.contact_number, party_name: @dastavej.party_name, project_id: @dastavej.project_id, unit_id: @dastavej.unit_id } }
    end

    assert_redirected_to dastavej_url(Dastavej.last)
  end

  test "should show dastavej" do
    get dastavej_url(@dastavej)
    assert_response :success
  end

  test "should get edit" do
    get edit_dastavej_url(@dastavej)
    assert_response :success
  end

  test "should update dastavej" do
    patch dastavej_url(@dastavej), params: { dastavej: { client_id: @dastavej.client_id, contact_number: @dastavej.contact_number, party_name: @dastavej.party_name, project_id: @dastavej.project_id, unit_id: @dastavej.unit_id } }
    assert_redirected_to dastavej_url(@dastavej)
  end

  test "should destroy dastavej" do
    assert_difference("Dastavej.count", -1) do
      delete dastavej_url(@dastavej)
    end

    assert_redirected_to dastavejs_url
  end
end
