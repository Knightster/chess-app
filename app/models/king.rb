class King < Piece
  def image
    if color == 'white'
      '&#9812;'
    else
      '&#9818;'
    end
  end

  def valid_move?(x, y)
    # guard clause style
    return false if blocked?(x, y) # checks if piece is blocking at destination coordinate
    return false if delta_x(x_position, x) > 1
    return false if delta_y(y_position, y) > 1

    # The king can castle
    if move_castle?(x, y)
      return true
    end

    true
  end

  # Support castling with the king
  def move_castle?(x, y)
    (castling_kingside?(x, y) || castling_queenside?(x, y)) && castling_never_moved?
  end

end
