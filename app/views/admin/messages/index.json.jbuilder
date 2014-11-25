json.array!(@messages) do |message|
  json.extract! message, :id, :user_id, :subject, :body
  json.url message_url(message, format: :json)
end
