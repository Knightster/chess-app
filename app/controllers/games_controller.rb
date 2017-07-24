class GamesController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create]

  def index; end

  def new; end

  def create
    @game = Game.create(game_params)
    @game.white_player = current_user
<<<<<<< HEAD
=======
    @game.status = 'Open'
    @game.update_attributes
  end

  def show

>>>>>>> 3d1acfc205ac3f6ef1469e68e12f9bbf63273147
  end

  def show; end

  private

  def game_params
    params.require(:game).permit(:white_player_id, :black_player_id, :game_name)
  end
end
