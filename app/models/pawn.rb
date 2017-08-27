class Pawn < Piece
  def image
    if color == 'white'
      '&#9817;'
    else
      '&#9823;'
    end
  end

  def valid_move?(x, y)
    return true if capture_move?(x, y)
    return false if blocked?(x, y)
    return false if backwards_move?(y)
    return false if horizontal_move?(x)
    standard_move?(x, y) || valid_dist?(y)
  end

  def standard_move?(x, y)
    x_diff = (x_position - x).abs
    y_diff = (y_position - y).abs
    x_diff.zero? && y_diff == 1
  end

  def backwards_move?(y)
    color == 'white' ? y_position < y : y_position > y
  end

  def capture_move?(x, y)
    x_diff = (x_position - x).abs
    y_diff = (y_position - y).abs
    return false if x_diff != 1 && y_diff != 1

    captured_piece = game.fetch_piece(x, y)
    return false if captured_piece.blank?
    return false if captured_piece.color == color
    true
  end

  def horizontal_move?(x)
    x_diff = (x_position - x).abs
    x_diff != 0
  end

  def valid_dist?(y)
    if first_move?
      (y - y_position).abs <= 2
    else
      (y - y_position).abs == 1
    end
  end

  def first_move?
    (y_position == 1 && color == 'black') || (y_position == 6 && color == 'white')
  end

  def en_passant?(x, y)
    #check if pawn is in 5th rank
    if player_id == white_player_id
       opponent = black_player_id
       return false if y > 3
    else
      opponent = white_player_id
      return false if y < 4
    
    #target pawn must be in an adjacent column 
    #and has just moved 2 steps as its first move
    target_pawn = game.pieces.where(type: "Pawn", player: opponent, x_position: x, y_position: y).first
    return false if target_pawn.first_move? != 2

    #opponent captures target pawn and moves one step diagonal towards column of target pawn
     target_pawn.update_attributes(position_x: nil, position_y: nil, captured: false)
  end
end
