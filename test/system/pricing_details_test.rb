require "application_system_test_case"

class PricingDetailsTest < ApplicationSystemTestCase
  setup do
    @pricing_detail = pricing_details(:one)
  end

  test "visiting the index" do
    visit pricing_details_url
    assert_selector "h1", text: "Pricing details"
  end

  test "should create pricing detail" do
    visit pricing_details_url
    click_on "New pricing detail"

    fill_in "Additional amount", with: @pricing_detail.additional_amount
    fill_in "Base price", with: @pricing_detail.base_price
    fill_in "Discount type", with: @pricing_detail.discount_type
    fill_in "Tax class", with: @pricing_detail.tax_class
    fill_in "Title", with: @pricing_detail.title_id
    fill_in "Vat amount", with: @pricing_detail.vat_amount
    click_on "Create Pricing detail"

    assert_text "Pricing detail was successfully created"
    click_on "Back"
  end

  test "should update Pricing detail" do
    visit pricing_detail_url(@pricing_detail)
    click_on "Edit this pricing detail", match: :first

    fill_in "Additional amount", with: @pricing_detail.additional_amount
    fill_in "Base price", with: @pricing_detail.base_price
    fill_in "Discount type", with: @pricing_detail.discount_type
    fill_in "Tax class", with: @pricing_detail.tax_class
    fill_in "Title", with: @pricing_detail.title_id
    fill_in "Vat amount", with: @pricing_detail.vat_amount
    click_on "Update Pricing detail"

    assert_text "Pricing detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Pricing detail" do
    visit pricing_detail_url(@pricing_detail)
    click_on "Destroy this pricing detail", match: :first

    assert_text "Pricing detail was successfully destroyed"
  end
end
