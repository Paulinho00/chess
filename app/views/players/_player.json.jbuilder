json.extract! player, :id, :player_id, :email, :username, :password, :created_at, :updated_at
json.url player_url(player, format: :json)
