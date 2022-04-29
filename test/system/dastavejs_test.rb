require "application_system_test_case"

class DastavejsTest < ApplicationSystemTestCase
  setup do
    @dastavej = dastavejs(:one)
  end

  test "visiting the index" do
    visit dastavejs_url
    assert_selector "h1", text: "Dastavejs"
  end

  test "should create dastavej" do
    visit dastavejs_url
    click_on "New dastavej"

    fill_in "Client", with: @dastavej.client_id
    fill_in "Contact number", with: @dastavej.contact_number
    fill_in "Party name", with: @dastavej.party_name
    fill_in "Project", with: @dastavej.project_id
    fill_in "Unit", with: @dastavej.unit_id
    click_on "Create Dastavej"

    assert_text "Dastavej was successfully created"
    click_on "Back"
  end

  test "should update Dastavej" do
    visit dastavej_url(@dastavej)
    click_on "Edit this dastavej", match: :first

    fill_in "Client", with: @dastavej.client_id
    fill_in "Contact number", with: @dastavej.contact_number
    fill_in "Party name", with: @dastavej.party_name
    fill_in "Project", with: @dastavej.project_id
    fill_in "Unit", with: @dastavej.unit_id
    click_on "Update Dastavej"

    assert_text "Dastavej was successfully updated"
    click_on "Back"
  end

  test "should destroy Dastavej" do
    visit dastavej_url(@dastavej)
    click_on "Destroy this dastavej", match: :first

    assert_text "Dastavej was successfully destroyed"
  end
end
