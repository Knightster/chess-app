class PiecesController < ApplicationController
  def update
    @piece = Piece.find(params[:id]) # find the piece to update
    if @piece.valid_move?(x, y)
       @piece.update_attributes(piece_params) # update and save to database
       redirect_to game_path(@game)
    else
      render :text => 'invalid move'
    end
  end

  private

  def piece_params
    params.require(:piece).permit(:x_position, :y_position)
  end
end
