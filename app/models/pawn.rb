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

    #Pawn can't move backwards
    # return false if color == 'white' ? y_position < y : y_position > y

    #Pawn can move vertically 1 space
    return true if delta_x(x_position, x).zero? && delta_y(y_position, y) == 1

    #Pawn can not move horizontally
    return false if delta_x(x_position, x) != 0

    #Pawn can move two spaces on FIRST move
    return true if color == 'white' && y_position == 6 || color = 'black' && y_position == 1
      delta_y(y_position, y) == 2

    #Pawn can move horizontally 1 space if capturing
      # return true if 




    # return true if capture_move?(x,y)
    # return true if delta_y(y_position, y) == 1

  end




  # def backwards_move?(y)
  #   color == 'white' ? y_position < y : y_position > y
  # end

  # def first_move?(y)
  #   if color == 'white' && y_position == 6 || color == 'black' && y_position == 1
  #     delta_y(y_position, y) == 2
  # end


  




end
