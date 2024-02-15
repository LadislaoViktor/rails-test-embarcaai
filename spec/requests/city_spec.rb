# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  before(:each) do
    @state = FactoryBot.create :state
    @cities = FactoryBot.create_list :city, 20,states_id: @state.id
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
      params = { 'city' => { 'states_id' => @cities.sample.states_id, 'name' => '' },
                 'commit' => 'Buscar' }
      get '/cities/search', params: params

      expect(response).to have_http_status(:ok)
      expect(assigns(:cities).count).to eq 20
    end
    it 'Get city by name' do
      params = { 'city' => { 'states_id' => '', 'name' => @cities.sample.name },
                 'commit' => 'Buscar' }
      get '/cities/search', params: params

      expect(response).to have_http_status(:ok)
      expect(assigns(:cities).count).to eq 1
    end
    it 'Get city by name' do
      random = rand(0..19)
      params = { 'city' => { 'states_id' => @cities[random].states_id, 'name' => @cities[random].name },
                 'commit' => 'Buscar' }
      get '/cities/search', params: params

      expect(response).to have_http_status(:ok)
      expect(assigns(:cities).count).to eq 1
    end
  end
end
