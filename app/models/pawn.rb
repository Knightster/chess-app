class Pawn < Piece
  def image
    if color == 'white'
      '&#9817;'
    else
      '&#9823;'
    end
  end

  def valid_move?(x,y)
    dx = delta_x(x_position, x)
    dy = delta_y(y_position, y)

    return false if blocked?(x,y)

    #pawn can't move horizontally
    return false if dx != 0 && dy.zero?

    #pawn moves vertically 1 space
    return true if dx == 0 && dy ==1

    return true if first_move?(y)
    
    return false if backwards_move?(y)


  end


  def capture_move?(x,y)
    x_diff = (x_position - x).abs  dx
    y_diff = (y_position - y).abs  dy

    if square_occupied?(x,y)
      return true if x_diff == 1 && y_diff == 1
      return false if x_diff > 1 && y_diff >1
  end

  def first_move?(y)
    (color == 'white' && y_position == 6) || (color == 'black' && y_position == 1)
    y_diff = (y_position - y).abs
    return true if y_diff == 1 || y_diff == 2
  end

  def backwards_move?(y)
    color == 'white' ? y_position < y : y_position > y
  end
  

end
