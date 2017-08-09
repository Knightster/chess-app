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

    dx = delta_x(x_position, x)
    dy = delta_y(y_position, y)

    #The queen can move diagonally
    if dx == dy
      return true
    end
    #The queen can move horizonally
    if dx > 0 && dy.zero?
      return true
    end
    #The queen can move vertically
    if dx.zero? && dy > 0
      return true
    end

    return false
  end
end
