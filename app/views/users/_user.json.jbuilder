json.extract! user, :id, :name, :age, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
