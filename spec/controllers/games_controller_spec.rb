require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'games#create action' do
    it 'should successfully create a new game in our database' do
      post :create, params: { game: { name: 'Test Game!' } }
      game = Game.last
      expect(response).to redirect_to game_path(game.id)
      expect(game.name).to eq('Test Game!')
    end
  end
end
