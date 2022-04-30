class PricingDetail < ApplicationRecord
  belongs_to :title
  attr_accessor :amount
end
