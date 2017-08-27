class PiecesController < ApplicationController
  def update
    @piece = Piece.find(params[:id]) # find the piece to update
    x = piece_params[:x_position].to_i
    y = piece_params[:y_position].to_i
    if @piece.valid_move?(x, y)
      @piece.update_attributes(piece_params) # update and save to database
      render json: { status: 'success' }
    else
      render json: { status: 'invalid move' }
    end
    @piece.game.whose_turn(@piece.color) # switch players after turn
  end

  private

  def piece_params
    params.require(:piece).permit(:x_position, :y_position)
  end
end
