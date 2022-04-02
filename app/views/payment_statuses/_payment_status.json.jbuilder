json.extract! payment_status, :id, :payment_mode_id, :payment_detail, :amount, :uuid, :created_at, :updated_at
json.url payment_status_url(payment_status, format: :json)
