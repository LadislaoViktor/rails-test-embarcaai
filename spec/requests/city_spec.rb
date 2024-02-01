require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  let(:cities) { create_list :city, 20 }

  describe 'GET /index' do
    it 'Get first 10 cities' do
      get '/cities'
      expect(response).to have_http_status(:ok)
      expect(assigns(:cities).length).to eq 10
    end
  end
end
