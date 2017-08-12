class Queen < Piece
  def self.image
    if color == 'white'
      '&#9813;'
    else
      '&#9819;'
    end
  end
  
  def valid_move?(x, y)
    p x_position
    p y_position
    return false if blocked?(x,y)
    return false if x_position == x && y_position == y
    return false
  

  if horizontal_move?(x_position, x, y_position, y)
    if delta_x(x_position, x) <= 1
      !blocked?(x,y)
    end
  elsif vertical_move?(x_position, x, y_position, y)
    if delta_y(y_position, y) <= 1
      !blocked?(x,y)
    end
  elsif diagonal_move?
    !blocked?(x,y)
  end
  end

end
