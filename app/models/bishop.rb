class Bishop < Piece
  def image
    if color == 'white'
      '&#9815;'
    else
      '&#9821;'
    end
  end

  def valid_move?(x, y)
    if blocked?(x, y)
      return false
    end

    # The bishop can move diagonally
    if delta_x(x_position, x) == delta_y(y_position, y)
      return true
    end

    # The bishop can't move diagonally
    return false
  end
end
