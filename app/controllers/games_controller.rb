class GamesController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create]

  def index; end

  def new; end

  def create
    @game = Game.create(game_params)
    @game.white_player = current_user
  end

  def show; end

  private

  def game_params
    params.require(:game).permit(:white_player_id, :black_player_id, :game_name)
  end
end
