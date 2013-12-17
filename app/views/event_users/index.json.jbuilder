json.array!(@event_users) do |event_user|
  json.extract! event_user, :id, :event_id, :uid, :event_name, :email, :first_name, :last_name, :is_admin, :is_host, :is_guest
  json.url event_user_url(event_user, format: :json)
end
