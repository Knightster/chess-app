require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "static_pages#index action" do
    it "should present the application homepage" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end