class Knight < Piece
  def image
    if color == 'white'
      '&#9816;'
    else
      '&#9822;'
    end
  end

  def valid_move?(x, y)
    return false unless
      (delta_x(x_position, x) == 1 && delta_y(y_position, y) == 2) ||
      (delta_x(x_position, x) == 2 && delta_y(y_position, y) == 1)
    true
  end
end
