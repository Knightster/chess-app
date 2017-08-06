class Queen < Piece
  def image
    if color == 'white'
      '&#9813;'
    else
      '&#9819;'
    end
  end

  def valid_move?(x, y)
    if blocked?(x, y)
      return false
    end

    # The queen can move horizonally
    if(delta_x(x_position, x) > 0 && delta_y(y_position, y).zero?)
      return true
    end

    # The queen can move vertically
    if(delta_x(x_position, x).zero? && delta_y(y_position, y) > 0)
      return true
    end

    # The queen can move diagonally
    if(delta_x(x_position, x) == delta_y(y_position, y))
      return true
    end

    # The queen can't move horizonally, vertically, and diagonally
    return false
  end
end
