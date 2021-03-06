class Game < ApplicationRecord
  # after_create :populate_game
  # belongs_to :white_player, class_name: "Player"
  # belongs_to :black_player, class_name: "Player"
  has_many :pieces

  # rubocop:disable MethodLength
  # rubocop:disable Metrics/AbcSize
  def populate_game
    # white pieces
    Rook.create(game_id: id, color: 'white', x_position: 0, y_position: 7)
    Knight.create(game_id: id, color: 'white', x_position: 1, y_position: 7)
    Bishop.create(game_id: id, color: 'white', x_position: 2, y_position: 7)
    Queen.create(game_id: id, color: 'white', x_position: 3, y_position: 7)
    King.create(game_id: id, color: 'white', x_position: 4, y_position: 7)
    Bishop.create(game_id: id, color: 'white', x_position: 5, y_position: 7)
    Knight.create(game_id: id, color: 'white', x_position: 6, y_position: 7)
    Rook.create(game_id: id, color: 'white', x_position: 7, y_position: 7)

    (0..7).each do |x_column|
      Pawn.create(game_id: id, color: 'white', x_position: x_column, y_position: 6)
    end

    # black pieces
    Rook.create(game_id: id, color: 'black', x_position: 0, y_position: 0)
    Knight.create(game_id: id, color: 'black', x_position: 1, y_position: 0)
    Bishop.create(game_id: id, color: 'black', x_position: 2, y_position: 0)
    King.create(game_id: id, color: 'black', x_position: 3, y_position: 0)
    Queen.create(game_id: id, color: 'black', x_position: 4, y_position: 0)
    Bishop.create(game_id: id, color: 'black', x_position: 5, y_position: 0)
    Knight.create(game_id: id, color: 'black', x_position: 6, y_position: 0)
    Rook.create(game_id: id, color: 'black', x_position: 7, y_position: 0)

    (0..7).each do |x_column|
      Pawn.create(game_id: id, color: 'black', x_position: x_column, y_position: 1)
    end
  end

  # rubocop:enable MethodLength
  # rubocop:enable Metrics/AbcSize

  def square_occupied?(x, y)
    !fetch_piece(x, y).nil?
  end

  def fetch_piece(x, y)
    pieces.where(x_position: x, y_position: y).first
  end

  def in_check?(color)
    king = Piece.where(color: color, type: 'King').first
    opposing_pieces = Piece.where('color != ? and captured = ?', color, false)

    opposing_pieces.each do |piece|
      return true if piece.valid_move?(king.x_position, king.y_position)
    end
    false
  end

  def checkmate?(color)
    # check to see if color is in check
    return false unless in_check?(color)
    # checks if a piece movement will cause king to be in check
    !any_valid_moves?(color)
  end

  def any_valid_moves?(color)
    pieces = Pieces.where(color: color, captured: false)
    pieces.each do |piece|
      (0..7).each do |x|
        (0..7).each do |y|
          return true if piece.valid_move?(x, y) && !piece.move_causes_check?(x, y)
        end
      end
    end
    false
  end

  def player_color(player)
    return 'white' if player.id == white_player_id
    return 'black' if player.id == black_player_id
    false
  end

  # keep track of whose turn
  def whose_turn(color)
    if color == 'black'
      update_attributes(turn: white_player_id)
    else
      update_attributes(turn: black_player_id)
    end
  end
end
