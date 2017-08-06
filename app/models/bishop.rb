class Bishop < Piece
  def image
    if color == 'white'
      '&#9815;'
    else
      '&#9821;'
    end
  end

  def valid_move?(x, y)
  end
end
