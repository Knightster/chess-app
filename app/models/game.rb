class Game < ApplicationRecord
  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User', required: false
  has_many :pieces

  def self.needs_second_player
    Game.where(status: 'Open')
  end
end
