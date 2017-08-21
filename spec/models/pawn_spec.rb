require 'rails_helper'

RSpec.describe Pawn, type: :model do
  it 'can move vertically' do
    game = Game.create
    pawn = Pawn.create(game_id: game.id, x_position: 3, y_position: 1, color: 'white')

    expect(pawn.valid_move?(3, 2)).to be true
    expect(pawn.valid_move?(3, 3)).to be true
  end

  it 'can not move two squares afte first move' do
    game = Game.create
    pawn = Pawn.create(game_id: game.id, x_position: 3, y_position: 3, color: 'white')

    expect(pawn.valid_move?(3, 5)).to be false
  end

  it 'can not move horizontally' do
    game = Game.create
    pawn = Pawn.create(game_id: game.id, x_position: 2, y_position: 3, color: 'white')

    expect(pawn.valid_move?(3, 3)).to be false
    expect(pawn.valid_move?(1, 3)).to be false
  end
end
