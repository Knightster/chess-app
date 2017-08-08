require 'rails_helper'

RSpec.describe Pawn, type: :model do
  let(:game) {Game.create}
  it "is blocked" do 
    pawn1 = Pawn.create(x_position: 0, y_position: 1, game_id: game.id)
    pawn2 = Pawn.create(x_position: 0, y_position: 2, game_id: game.id)
    expect(pawn1.blocked?(0,2)).to eq true
  end
  it "is blocked" do 
    pawn1 = Pawn.create(x_position: 0, y_position: 1, game_id: game.id)
    expect(pawn1.blocked?(0,2)).to eq false
  end



end
