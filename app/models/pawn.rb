class Pawn < Piece
  def image
    if color == 'white'
      '&#9817;'
    else
      '&#9823;'
    end
  end

  def valid_move?(x,y)
    return false if blocked?(x,y)
    return false if backwards_move?(y)
    return true if capture_move?(x,y)
    return true if delta_y(y_position, y) == 1

  end



  def backwards_move?(y)
    color == 'white' ? y_position < y : y_position > y
  end

  def first_move?(y)
    if color == 'white' && y_position == 6 || color == 'black' && y_position == 1
      delta_y(y_position, y) == 2
  end


  def capture_move?(x,y)

  end

  




end
