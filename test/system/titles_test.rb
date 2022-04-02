require "application_system_test_case"

class TitlesTest < ApplicationSystemTestCase
  setup do
    @title = titles(:one)
  end

  test "visiting the index" do
    visit titles_url
    assert_selector "h1", text: "Titles"
  end

  test "should create title" do
    visit titles_url
    click_on "New title"

    fill_in "Block no", with: @title.block_no
    fill_in "Client", with: @title.client_id
    fill_in "Description", with: @title.description
    fill_in "Pincode", with: @title.pincode
    fill_in "Taluka", with: @title.taluka
    fill_in "Village", with: @title.village
    click_on "Create Title"

    assert_text "Title was successfully created"
    click_on "Back"
  end

  test "should update Title" do
    visit title_url(@title)
    click_on "Edit this title", match: :first

    fill_in "Block no", with: @title.block_no
    fill_in "Client", with: @title.client_id
    fill_in "Description", with: @title.description
    fill_in "Pincode", with: @title.pincode
    fill_in "Taluka", with: @title.taluka
    fill_in "Village", with: @title.village
    click_on "Update Title"

    assert_text "Title was successfully updated"
    click_on "Back"
  end

  test "should destroy Title" do
    visit title_url(@title)
    click_on "Destroy this title", match: :first

    assert_text "Title was successfully destroyed"
  end
end
