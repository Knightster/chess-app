class GamesController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create]

  def index; end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    @game.populate_game
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
