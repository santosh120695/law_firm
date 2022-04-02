require "test_helper"

class PricingDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pricing_detail = pricing_details(:one)
  end

  test "should get index" do
    get pricing_details_url
    assert_response :success
  end

  test "should get new" do
    get new_pricing_detail_url
    assert_response :success
  end

  test "should create pricing_detail" do
    assert_difference("PricingDetail.count") do
      post pricing_details_url, params: { pricing_detail: { additional_amount: @pricing_detail.additional_amount, base_price: @pricing_detail.base_price, discount_type: @pricing_detail.discount_type, tax_class: @pricing_detail.tax_class, title_id: @pricing_detail.title_id, vat_amount: @pricing_detail.vat_amount } }
    end

    assert_redirected_to pricing_detail_url(PricingDetail.last)
  end

  test "should show pricing_detail" do
    get pricing_detail_url(@pricing_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_pricing_detail_url(@pricing_detail)
    assert_response :success
  end

  test "should update pricing_detail" do
    patch pricing_detail_url(@pricing_detail), params: { pricing_detail: { additional_amount: @pricing_detail.additional_amount, base_price: @pricing_detail.base_price, discount_type: @pricing_detail.discount_type, tax_class: @pricing_detail.tax_class, title_id: @pricing_detail.title_id, vat_amount: @pricing_detail.vat_amount } }
    assert_redirected_to pricing_detail_url(@pricing_detail)
  end

  test "should destroy pricing_detail" do
    assert_difference("PricingDetail.count", -1) do
      delete pricing_detail_url(@pricing_detail)
    end

    assert_redirected_to pricing_details_url
  end
end
