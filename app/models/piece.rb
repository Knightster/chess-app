class Piece < ApplicationRecord


  #check if horizonal move
  def horizontal_move?(x_position, x, y_position, y)
     x_position != x_end && y_position == y
  end

  #check for horizontal distance moved
  def delta_x(x_position, x)
    (x - x_position).abs 
  end

  #check if vertical move
  def vertical_move?(x_position, x, y_position, y)
    x_position == x && y_position != y
  end

  #check for vertical distance moved
  def delta_y(y_position, y)
    (y - y_position).abs
  end

  #check if diagonal move
  def diagonal_move?
    delta_x == delta_y
  end

  def is_blocked?
    obstructed_squares = is_occupied?(x, y)
    return false if obstructed_squares.empty?
    obstructed_squares.each do |square|
      return true if game.is_occupied?(x,y)
    end
    false
  end

end


