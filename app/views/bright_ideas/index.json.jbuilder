json.array!(@bright_ideas) do |bright_idea|
  json.extract! bright_idea, :id, :idea
  json.url bright_idea_url(bright_idea, format: :json)
end
