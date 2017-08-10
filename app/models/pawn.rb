class Pawn < Piece
  def image
    if color == 'white'
      '&#9817;'
    else
      '&#9823;'
    end
  end

  def valid_move?(x, y)
    return false if blocked?(x, y)
    return false if backwards_move?(y)
    return true if capture_move?(x, y)
    return false if horizontal_move?(x)

    right_dist?(y) || en_passant?(y)
  end

  def backwards_move?(y)
    color == 'white' ? y_position > y : y_position < y
  end

  def capture_move?(x, y)
    x_diff = (x_position - x).abs
    y_diff = (y_position - y).abs
    captured_piece = square_occupied?(x, y)

    return true if x_diff == 1 && y_diff == 1
    return false if x_diff > 1 && y_diff > 1
    return false if captured_piece.blank?
    return x_diff == 1 && y_diff.zero? if captured_piece.state == 'en_passant'
    false
  end

  def horizontal_move?(x)
    x_diff = (x_position - x).abs
    y_diff = (y_position - y).abs
    x_diff != 0 && y_diff.zero?
  end

  def right_dist?(y)
    (y - y_position).abs == 1
  end

  def first_move?
    return unless (y_position != 1 && color == 'black') || (y_position != 6 && color == 'white')
    (y - y_position).abs == 2 || (y - y_position).abs == 1
  end

  def en_passant?(y)
    y_diff = (y_position - y).abs
    first_move?(y) ? (y_diff == 1 || y_diff == 2) : false
  end
end
