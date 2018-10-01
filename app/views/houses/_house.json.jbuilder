json.extract! house, :id, :location, :area, :year, :style, :price, :floors, :basement, :owner, :buyers, :created_at, :updated_at
json.url house_url(house, format: :json)
