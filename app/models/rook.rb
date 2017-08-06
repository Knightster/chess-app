class Rook < Piece
  def image
    if color == 'white'
      '&#9814;'
    else
      '&#9820;'
    end
  end

  def valid_move?(x, y)
    return false unless
    return false if blocked?(x,y)

    # The rook can move horizontally      
    if(delta_x(x_position, x) > 0 && delta_y(y_position, y).zero?)
      return true
    end

    # The rook can move vertically      
    if(delta_x(x_position, x).zero? && delta_y(y_position, y) > 0)
      return true
    end

    # The rook can't move horizontally and vertically
    return false
  end
end
