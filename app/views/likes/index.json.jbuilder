json.array!(@likes) do |like|
  json.extract! like, :id, :user_id, :bright_idea_id
  json.url like_url(like, format: :json)
end
