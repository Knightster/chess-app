class Rook < Piece
  def image
    if color == 'white'
      '&#9814;'
    else
      '&#9820;'
    end
  end
end
