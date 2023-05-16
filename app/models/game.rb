class Game < ApplicationRecord
  belongs_to :player_white, class_name: 'Player'
  belongs_to :player_black, class_name: 'Player'
end
