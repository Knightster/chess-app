class Piece < ApplicationRecord


  #check if horizonal move
  def horizontal_dir(x_start, x_end, y_start, y_end)
    if x_start != x_end && y_start == y_end
      return(x_end - x_start).abs
    end
  end

  #check if vertical move
  def vertical_dir(x_start, x_end, y_start, y_end)
    if x_start == x_end && y_start != y_end
      return(y_end - y_start).abs
    end
  end

  def diagonal_move
    if horizontal_dir == vertical_dir
      return true
  end

end

def filled_square(x, y)
    pieces.where(x_dest: x, y_dest: y).last
end