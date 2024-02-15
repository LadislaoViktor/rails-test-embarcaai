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
    it 'Get city by state and name' do
      random = rand(0..19)
      params = { 'city' => { 'states_id' => @cities[random].states_id, 'name' => @cities[random].name },
                 'commit' => 'Buscar' }
      get '/cities/search', params: params

      expect(response).to have_http_status(:ok)
      expect(assigns(:cities).count).to eq 1
    end
  end

  describe 'POST /cities' do
    it 'Creates a city successfully' do 
      post '/cities', params:{"city"=>{"name"=>"Kawabanga", "states_id"=>@state.id}}
      @city = City.last
      expect(response).to redirect_to(cities_url(@city))
    end
    it 'Returns an error if name is blank' do 
      post '/cities', params:{"city"=>{"name"=>"", "states_id"=>@state.id}}
      expect(response.body).to include("error prohibited this from being saved")
    end
  end

  describe 'PUT /cities' do
    it 'should update a city successfully' do
      put "/cities/#{@cities.first.id}", params:{"city"=>{"name"=>"Abatiáo", "states_id"=>@state.id}, "commit"=>"Save", "id"=>@cities.first.id}
      expect(response).to redirect_to(cities_url(@cities.first))
    end
    it 'should return an error if city name is blank' do
      put "/cities/#{@cities.first.id}", params:{"city"=>{"name"=>"", "states_id"=>@state.id}, "commit"=>"Save", "id"=>@cities.first.id}
      expect(response.body).to include("error prohibited this from being saved")
    end
  end
end
