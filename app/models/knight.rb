class Knight < Piece
  def image
    if color == 'white'
      '&#9816;'
    else
      '&#9822;'
    end
  end
end
