class Rook < Piece
  def image
    if color == 'white'
      '&#9814;'
    else
      '&#9820;'
    end
  end

  def valid_move?(x, y)
    return false if blocked?(x, y)

    # The rook can move horizontally
    return true if delta_x(x_position, x) > 0 && delta_y(y_position, y).zero?

    # The rook can move vertically
    return true if delta_x(x_position, x).zero? && delta_y(y_position, y) > 0

    # The rook can't move horizontally and vertically
    false
  end
end
