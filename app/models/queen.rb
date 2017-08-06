class Queen < Piece
  def image
    if color == 'white'
      '&#9813;'
    else
      '&#9819;'
    end
  end

  def valid_move?(x, y)
  end
end
