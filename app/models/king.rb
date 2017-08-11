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
    return true if move_castle?(x, y)

    true
  end

  # Support castling with the king
  def move_castle?(x, y)
    castling_kingside?(x, y) && castling_never_moved?
  end

  # The king can attack to the castle on the kingside
  def castling_kingside?(x, y)
    x == 6 && y == y_position && castling_rook_kingside && castling_rook_kingside.castling_never_moved? && \
      castling_rook_kingside.blocked?(4, y_position) == false
  end
end
