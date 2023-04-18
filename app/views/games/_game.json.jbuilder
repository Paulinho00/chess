json.extract! game, :id, :game_id, :status, :start_date, :who_moves, :fen, :player_black_id, :player_white_id, :end_date, :created_at, :updated_at
json.url game_url(game, format: :json)
