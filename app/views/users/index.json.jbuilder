json.array!(@users) do |user|
  json.extract! user, :id, :name, :alias, :email
  json.url user_url(user, format: :json)
end
