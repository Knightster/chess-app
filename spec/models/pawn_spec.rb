require 'rails_helper'

RSpec.describe Pawn, type: :model do
  it "is blocked" do 
    pawn1 = Pawn.create(x_position: 0, y_position: 1)
    pawn2 = Pawn.create(x_position: 0, y_position: 2)
    expect(pawn1.blocked?(0,2)).to eq true
  end
end
