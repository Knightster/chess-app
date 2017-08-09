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

    right_dist?(y)
  end

  def backwards_move?(y)
    color == 'white' ? y_position > y : y_position < y
  end

  def capture_move?(x, y)
    x_diff = (x_position - x).abs
    y_diff = (y_position - y).abs
    # captured_piece = square_occupied?(x, y)

    return true if x_diff == 1 && y_diff == 1
    return false if x_diff > 1 && y_diff > 1
    return false if square_occupied?(x, y).nil?
  end

  def horizontal_move?(x)
    x_diff = (x_position - x).abs
    y_diff = (y_position - y).abs
    x_diff != 0 && y_diff.zero?
  end

  def right_dist?(y)
    if first_move?
      (y - y_position).abs == 2
    else
      (y - y_position).abs == 1
    end
  end

  def first_move?
    (y_position == 1 && color == 'black') || (y_position == 6 && color == 'white')
  end
end
