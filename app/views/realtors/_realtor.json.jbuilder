json.extract! realtor, :id, :email, :name, :password, :phone, :created_at, :updated_at
json.url realtor_url(realtor, format: :json)
