require "application_system_test_case"

class StageMastersTest < ApplicationSystemTestCase
  setup do
    @stage_master = stage_masters(:one)
  end

  test "visiting the index" do
    visit stage_masters_url
    assert_selector "h1", text: "Stage masters"
  end

  test "should create stage master" do
    visit stage_masters_url
    click_on "New stage master"

    fill_in "Name", with: @stage_master.name
    click_on "Create Stage master"

    assert_text "Stage master was successfully created"
    click_on "Back"
  end

  test "should update Stage master" do
    visit stage_master_url(@stage_master)
    click_on "Edit this stage master", match: :first

    fill_in "Name", with: @stage_master.name
    click_on "Update Stage master"

    assert_text "Stage master was successfully updated"
    click_on "Back"
  end

  test "should destroy Stage master" do
    visit stage_master_url(@stage_master)
    click_on "Destroy this stage master", match: :first

    assert_text "Stage master was successfully destroyed"
  end
end
