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

    # Prevent from moving into check
    opposing_pieces = Piece.where('color != ? and captured = ?', color, false)

    opposing_pieces.each do |piece|
      return false if piece.valid_move?(x, y)
    end

    # The king can castle
    return true if move_castle?(x, y)

    true
  end

  # Support castling with the king
  def move_castle?(x, y)
    (castling_kingside?(x, y) || castling_queenside?(x, y)) && castling_never_moved?
  end

  # The king can attack to the castle on the king side
  def castling_kingside?(x, y)
    x == 6 && y == y_position && castling_rook_kingside && castling_rook_kingside.castling_never_moved? && \
      castling_rook_kingside.blocked?(4, y_position) == false
  end

  # The king can attack to the castle on the queen side
  def castling_queenside?(x, y)
    x == 2 && y == y_position && castling_rook_queenside && castling_rook_queenside.castling_never_moved? && \
      castling_rook_queenside.blocked?(4, y_position) == false
  end

  # The rook to castle with king side
  def castling_rook_kingside
    game.pieces.where(x_position: 7, y_position: y_position, color: color, type: 'Rook').first
  end

  # The rook to castle with queen side
  def castling_rook_queenside
    game.pieces.where(x_position: 0, y_position: y_position, color: color, type: 'Rook').first
  end

  def castle!(x, y)
    if castling_kingside?(x, y)
      castling_rook_kingside.update_attributes(x_position: 5, y_position: y_position)
    end

    if castling_queenside?(x, y)
      castling_rook_queenside.update_attributes(x_position: 3, y_position: y_position)
    end

    update_attributes(x_position: x, y_position: y)
  end

  def move_to!(x, y)
    castle!(x, y) if move_castle?(x, y)
  end
end
