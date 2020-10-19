json.extract! lead, :id, :name, :description, :status, :amount, :probability, :created_at, :updated_at
json.url lead_url(lead, format: :json)
