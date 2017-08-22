require 'rails_helper'

RSpec.describe Pawn, type: :model do
  it 'can move vertically and one or two squares on first move' do
    game = Game.create
    pawn = Pawn.create(game_id: game.id, x_position: 3, y_position: 1, color: 'black')
    # y = 2
    # x = 3
    # expect(pawn.blocked?(3, 2)).to be false
    # expect(pawn.backwards_move?(y)).to be false
    # expect(pawn.capture_move?(x, y)).to be false
    # expect(pawn.horizontal_move?(x)).to be false
    # expect(pawn.standard_move?(x, y)).to be true
    # expect(pawn.first_move?(y)).to be true
    expect(pawn.valid_move?(3, 2)).to be true
    expect(pawn.valid_move?(3, 3)).to be true
  end

  it 'can not move two squares after first move' do
    game = Game.create
    pawn = Pawn.create(game_id: game.id, x_position: 3, y_position: 4, color: 'white')

    expect(pawn.valid_move?(3, 2)).to be false
  end

  it 'can not move horizontally' do
    game = Game.create
    pawn = Pawn.create(game_id: game.id, x_position: 2, y_position: 3, color: 'white')

    expect(pawn.valid_move?(3, 3)).to be false
    expect(pawn.valid_move?(1, 3)).to be false
  end

  it 'capturing move' do
    game = Game.create
    pawn1 = Pawn.create(game_id: game.id, x_position: 2, y_position: 5, color: 'white')
    Pawn.create(game_id: game.id, x_position: 3, y_position: 6, color: 'black')

    expect(pawn1.valid_move?(3, 6)).to be true
  end
end
