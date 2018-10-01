json.extract! inquiry, :id, :subject, :message, :created_at, :updated_at
json.url inquiry_url(inquiry, format: :json)
