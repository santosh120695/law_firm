json.extract! client, :id, :name, :uuid, :active, :location, :contact_no, :created_at, :updated_at
json.url client_url(client, format: :json)
