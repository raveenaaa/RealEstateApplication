json.extract! search, :id, :location, :min_price, :max_price, :min_area, :max_area, :created_at, :updated_at
json.url search_url(search, format: :json)
