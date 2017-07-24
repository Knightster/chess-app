class Game < ApplicationRecord
<<<<<<< HEAD
  belongs_to :white_player, class_name: 'Player'
  belongs_to :black_player, class_name: 'Player'
=======
  belongs_to :white_player, class_name: "User"
  belongs_to :black_player, class_name: "User", required: false
>>>>>>> 3d1acfc205ac3f6ef1469e68e12f9bbf63273147
  has_many :pieces

  def self.needs_second_player?
    Game.where(status: 'Open')
  end
end
