require "application_system_test_case"

class StatusMastersTest < ApplicationSystemTestCase
  setup do
    @status_master = status_masters(:one)
  end

  test "visiting the index" do
    visit status_masters_url
    assert_selector "h1", text: "Status masters"
  end

  test "should create status master" do
    visit status_masters_url
    click_on "New status master"

    fill_in "Active", with: @status_master.active
    fill_in "Color", with: @status_master.color
    fill_in "Name", with: @status_master.name
    fill_in "Uuid", with: @status_master.uuid
    click_on "Create Status master"

    assert_text "Status master was successfully created"
    click_on "Back"
  end

  test "should update Status master" do
    visit status_master_url(@status_master)
    click_on "Edit this status master", match: :first

    fill_in "Active", with: @status_master.active
    fill_in "Color", with: @status_master.color
    fill_in "Name", with: @status_master.name
    fill_in "Uuid", with: @status_master.uuid
    click_on "Update Status master"

    assert_text "Status master was successfully updated"
    click_on "Back"
  end

  test "should destroy Status master" do
    visit status_master_url(@status_master)
    click_on "Destroy this status master", match: :first

    assert_text "Status master was successfully destroyed"
  end
end
