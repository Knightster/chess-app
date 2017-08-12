require 'rails_helper'

RSpec.describe PiecesController, type: :controller do
  describe 'pieces#update action' do
    before :each do
      @piece.valid_move?
    end
    it 'should successfully change piece attribute' do
      put :update, :id => @piece.id, :piece => {:x_position => x, :y_position => y}      
    end
  end
end
