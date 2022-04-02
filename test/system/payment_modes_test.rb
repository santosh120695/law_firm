require "application_system_test_case"

class PaymentModesTest < ApplicationSystemTestCase
  setup do
    @payment_mode = payment_modes(:one)
  end

  test "visiting the index" do
    visit payment_modes_url
    assert_selector "h1", text: "Payment modes"
  end

  test "should create payment mode" do
    visit payment_modes_url
    click_on "New payment mode"

    check "Active" if @payment_mode.active
    fill_in "Name", with: @payment_mode.name
    fill_in "Uuid", with: @payment_mode.uuid
    click_on "Create Payment mode"

    assert_text "Payment mode was successfully created"
    click_on "Back"
  end

  test "should update Payment mode" do
    visit payment_mode_url(@payment_mode)
    click_on "Edit this payment mode", match: :first

    check "Active" if @payment_mode.active
    fill_in "Name", with: @payment_mode.name
    fill_in "Uuid", with: @payment_mode.uuid
    click_on "Update Payment mode"

    assert_text "Payment mode was successfully updated"
    click_on "Back"
  end

  test "should destroy Payment mode" do
    visit payment_mode_url(@payment_mode)
    click_on "Destroy this payment mode", match: :first

    assert_text "Payment mode was successfully destroyed"
  end
end
