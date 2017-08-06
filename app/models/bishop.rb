class Bishop < Piece
  def image
    if color == 'white'
      '&#9815;'
    else
      '&#9821;'
    end
  end

  def valid_move?(x, y)
    return false if blocked?(x, y)

    # The bishop can move diagonally
    return true if delta_x(x_position, x) == delta_y(y_position, y)

    # The bishop can't move diagonally
    false
  end
end
