class Piece < ApplicationRecord
  belongs_to :game
  # check if horizonal move
  def horizontal_move?(x_position, x, y_position, y)
    x_position != x && y_position == y
  end

  # check for horizontal distance moved
  def delta_x(x_position, x)
    (x - x_position).abs
  end

  # check if vertical move
  def vertical_move?(x_position, x, y_position, y)
    x_position == x && y_position != y
  end

  # check for vertical distance moved
  def delta_y(y_position, y)
    (y - y_position).abs
  end

  # check if diagonal move
  def diagonal_move?
    delta_x == delta_y
  end

  def blocked?(x, y)
    # determine the direction the piece is traveling to
    x_direction = x <=> x_position
    y_direction = y <=> y_position

    # how many times will the check occur
    steps = delta_x > delta_y ? delta_x : delta_y

    # save the coordinates of the path into an array
    piece_path = []

    # determine which squares to check
    steps.times do
      piece_path.push([x += x_direction, y += y_direction])
    end

    piece_path.each do |square|
      return true if game.square_occupied?(square[0], square[1])
    end
    false
  end

  def move_to!(x, y)
    return false unless valid_move?(x, y)
    if square_occupied?(x, y)
      target_piece = game.piece.find_by(x_position: x, y_position: y)
      target_piece.update_attributes(x_position: nil, y_position: nil, captured: true)
    end
    update_attributes(x_position: x, y_position: y)
  end
  
end