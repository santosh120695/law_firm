class PaymentStatus < ApplicationRecord
  belongs_to :payment_mode
  belongs_to :title
end
