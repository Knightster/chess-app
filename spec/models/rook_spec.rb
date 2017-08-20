require 'rails_helper'

RSpec.describe Rook, type: :model do
  it 'can move horizontally' do
    game = Game.create
    rook = Rook.create(game_id: game.id, x_position: 4, y_position: 4, color: 'white')

    expect(rook.valid_move?(4, 0)).to be true
    expect(rook.valid_move?(4, 6)).to be true
  end

  it 'can move vertically' do
    game = Game.create
    rook = Rook.create(game_id: game.id, x_position: 4, y_position: 4, color: 'white')

    expect(rook.valid_move?(0, 4)).to be true
    expect(rook.valid_move?(6, 4)).to be true
  end

  it 'can move diagonally' do
    game = Game.create
    rook = Rook.create(game_id: game.id, x_position: 4, y_position: 4, color: 'white')

    expect(rook.valid_move?(0, 0)).to be false
    expect(rook.valid_move?(6, 6)).to be false
  end
end
