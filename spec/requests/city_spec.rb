require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  before(:each) do
    FactoryBot.create_list :state, 5
    @cities = FactoryBot.create_list :city, 20
  end

  describe 'GET /index' do
    it 'Get first 10 cities' do
      get '/cities'
      expect(response).to have_http_status(:ok)
      expect(assigns(:cities).length).to eq 10
    end
  end

  describe 'Get /search' do
    it 'Get city by state' do
      params = { 'city' => { 'state_id' => @cities.sample.state_id, 'name' => '' },
                 'commit' => 'Buscar' }
      get '/cities/search', params: params

      expect(response).to have_http_status(:ok)
      expect(assigns(:cities).count).to eq 1
    end
    it 'Get city by name' do
      params = { 'city' => { 'state_id' => '', 'name' => @cities.sample.name },
                 'commit' => 'Buscar' }
      get '/cities/search', params: params

      expect(response).to have_http_status(:ok)
      expect(assigns(:cities).count).to eq 1
    end
    it 'Get city by name' do
      random = rand(0..19)
      params = { 'city' => { 'state_id' => @cities[random].state_id, 'name' => @cities[random].name },
                 'commit' => 'Buscar' }
      get '/cities/search', params: params

      expect(response).to have_http_status(:ok)
      expect(assigns(:cities).count).to eq 1
    end
  end
end
