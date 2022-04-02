require "application_system_test_case"

class PaymentStatusesTest < ApplicationSystemTestCase
  setup do
    @payment_status = payment_statuses(:one)
  end

  test "visiting the index" do
    visit payment_statuses_url
    assert_selector "h1", text: "Payment statuses"
  end

  test "should create payment status" do
    visit payment_statuses_url
    click_on "New payment status"

    fill_in "Amount", with: @payment_status.amount
    fill_in "Payment detail", with: @payment_status.payment_detail
    fill_in "Payment mode", with: @payment_status.payment_mode_id
    fill_in "Uuid", with: @payment_status.uuid
    click_on "Create Payment status"

    assert_text "Payment status was successfully created"
    click_on "Back"
  end

  test "should update Payment status" do
    visit payment_status_url(@payment_status)
    click_on "Edit this payment status", match: :first

    fill_in "Amount", with: @payment_status.amount
    fill_in "Payment detail", with: @payment_status.payment_detail
    fill_in "Payment mode", with: @payment_status.payment_mode_id
    fill_in "Uuid", with: @payment_status.uuid
    click_on "Update Payment status"

    assert_text "Payment status was successfully updated"
    click_on "Back"
  end

  test "should destroy Payment status" do
    visit payment_status_url(@payment_status)
    click_on "Destroy this payment status", match: :first

    assert_text "Payment status was successfully destroyed"
  end
end
