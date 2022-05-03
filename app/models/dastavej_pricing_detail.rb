class DastavejPricingDetail < ApplicationRecord
  belongs_to :dastavej
  attr_accessor :amount

  def total_amount
    (self.base_price + self.additional_amount + self.vat_amount rescue 0)
  end
end
