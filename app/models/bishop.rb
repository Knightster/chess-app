class Bishop < Piece
  def image
    if color == 'white'
      '&#9815;'
    else
      '&#9821;'
    end
  end
end
