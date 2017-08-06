class Queen < Piece
  def image
    if color == 'white'
      '&#9813;'
    else
      '&#9819;'
    end
  end

  def valid_move?(x, y)
    return false if blocked?(x, y)

    # The queen can move horizonally
    return true if delta_x(x_position, x) > 0 && delta_y(y_position, y).zero?

    # The queen can move vertically
    return true if delta_x(x_position, x).zero? && delta_y(y_position, y) > 0

    # The queen can move diagonally
    return true if delta_x(x_position, x) == delta_y(y_position, y)

    # The queen can't move horizonally, vertically, and diagonally
    false
  end
end
