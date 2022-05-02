class PricingDetail < ApplicationRecord
  belongs_to :title
  attr_accessor :amount

  def total_amount 
    self.base_price + self.additional_amount + self.vat_amount
  end
end
