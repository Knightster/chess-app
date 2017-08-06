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

    if delta_x(x_position, x) > 0 && delta_y(y_position, y).zero?
      return true # The queen can move horizonally
    elsif delta_x(x_position, x).zero? && delta_y(y_position, y) > 0
      return true # The queen can move vertically
    elsif delta_x(x_position, x) == delta_y(y_position, y)
      return true # The queen can move diagonally
    else
      return false # The queen can't move horizonally, vertically, and diagonally
    end
  end
end
