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
    return true if standard_move?(x, y)
    return true if first_move?(y)

    right_dist?(y)
  end

  def standard_move?(x, y)
    x_diff = (x_position - x).abs
    y_diff = (y_position - y).abs
    x_diff.zero? && y_diff == 1
  end

  def backwards_move?(y)
    color == 'white' ? y_position > y : y_position < y
  end

  def capture_move?(x, y)
    x_diff = (x_position - x).abs
    y_diff = (y_position - y).abs
    captured_piece = game.square_occupied?(x, y)

    return true if x_diff == 1 && y_diff == 1
    return false if x_diff > 1 && y_diff > 1
    return false if captured_piece.blank?
  end

  def horizontal_move?(x)
    x_diff = (x_position - x).abs
    x_diff != 0
  end

  def right_dist?(y)
    (y - y_position).abs == 1
  end

  def first_move?(y)
    return true if (y_position == 1 && color == 'black') || (y_position == 6 && color == 'white')
    (y - y_position).abs == 2 || (y - y_position).abs == 1
  end
end
