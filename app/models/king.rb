class King < Piece
  def image
    if color == 'white'
      '&#9812;'
    else
      '&#9818;'
    end
  end

  def valid_move?(x,y)
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
