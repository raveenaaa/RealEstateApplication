json.extract! reply, :id, :message, :created_at, :updated_at
json.url reply_url(reply, format: :json)
