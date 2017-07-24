class Game < ApplicationRecord
  belongs_to :white_player, class_name: 'Player'
  belongs_to :black_player, class_name: 'Player'
  has_many :pieces
end
