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

    dx = delta_x(x_position, x)
    dy = delta_y(y_position, y)

    return true if dx == dy
    return true if dx > 0 && dy.zero?
    return true if dx.zero? && dy > 0

    false
  end
end
