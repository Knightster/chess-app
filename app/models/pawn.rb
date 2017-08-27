class Pawn < Piece
  def image
    if color == 'white'
      '&#9817;'
    else
      '&#9823;'
    end
  end

  def valid_move?(x, y)
    return true if capture_move?(x, y)
    return false if blocked?(x, y)
    return false if backwards_move?(y)
    return false if horizontal_move?(x)
    standard_move?(x, y) || valid_dist?(y)
  end

  def standard_move?(x, y)
    x_diff = (x_position - x).abs
    y_diff = (y_position - y).abs
    x_diff.zero? && y_diff == 1
  end

  def backwards_move?(y)
    color == 'white' ? y_position < y : y_position > y
  end

  def capture_move?(x, y)
    x_diff = (x_position - x).abs
    y_diff = (y_position - y).abs
    return false if x_diff != 1 && y_diff != 1

    captured_piece = game.fetch_piece(x, y)
    return false if captured_piece.blank?
    return false if captured_piece.color == color
    true
  end

  def horizontal_move?(x)
    x_diff = (x_position - x).abs
    x_diff != 0
  end

  def valid_dist?(y)
    if first_move?
      (y - y_position).abs <= 2
    else
      (y - y_position).abs == 1
    end
  end

  def first_move?
    (y_position == 1 && color == 'black') || (y_position == 6 && color == 'white')
  end
end
