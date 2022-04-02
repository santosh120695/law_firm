json.extract! payment_mode, :id, :name, :uuid, :active, :created_at, :updated_at
json.url payment_mode_url(payment_mode, format: :json)
