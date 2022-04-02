json.extract! pricing_detail, :id, :base_price, :additional_amount, :discount_type, :tax_class, :vat_amount, :title_id, :created_at, :updated_at
json.url pricing_detail_url(pricing_detail, format: :json)
