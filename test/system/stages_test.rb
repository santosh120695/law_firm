require "application_system_test_case"

class StagesTest < ApplicationSystemTestCase
  setup do
    @stage = stages(:one)
  end

  test "visiting the index" do
    visit stages_url
    assert_selector "h1", text: "Stages"
  end

  test "should create stage" do
    visit stages_url
    click_on "New stage"

    fill_in "Final entry", with: @stage.final_entry
    fill_in "Initial entry", with: @stage.initial_entry
    fill_in "Item", with: @stage.item_id
    fill_in "Item type", with: @stage.item_type
    fill_in "Stage date", with: @stage.stage_date
    fill_in "Stage master", with: @stage.stage_master_id
    click_on "Create Stage"

    assert_text "Stage was successfully created"
    click_on "Back"
  end

  test "should update Stage" do
    visit stage_url(@stage)
    click_on "Edit this stage", match: :first

    fill_in "Final entry", with: @stage.final_entry
    fill_in "Initial entry", with: @stage.initial_entry
    fill_in "Item", with: @stage.item_id
    fill_in "Item type", with: @stage.item_type
    fill_in "Stage date", with: @stage.stage_date
    fill_in "Stage master", with: @stage.stage_master_id
    click_on "Update Stage"

    assert_text "Stage was successfully updated"
    click_on "Back"
  end

  test "should destroy Stage" do
    visit stage_url(@stage)
    click_on "Destroy this stage", match: :first

    assert_text "Stage was successfully destroyed"
  end
end
