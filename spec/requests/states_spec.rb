require 'rails_helper'

RSpec.describe "States", type: :request do
  before(:each) do
    @states = FactoryBot.create_list :state, 20
  end
  describe "GET /states" do
    it "Gets states#index" do
      get states_path
      expect(response.body).to include('New state')
      expect(response).to have_http_status(200)
      expect(assigns(:states).count).to eq 20
    end
    
    it 'Get states#new' do
      get '/states'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /states' do
    it 'Creates a state successfully' do 
      post '/states', params:{"state"=>{"name"=>"Kawabanga"}}
      @state = State.last
      expect(response).to redirect_to(@state)
    end
    it 'Returns an error if name is blank' do 
      post '/states', params:{"state"=>{"name"=>""}}
      expect(response.body).to include("error prohibited this state from being saved")
    end
  end

  describe 'PUT /states' do
    it 'should update a state successfully' do
      put "/states/#{@states.first.id}", params:{"state"=>{"name"=>"Abatiáo"}, "commit"=>"Save", "id"=>@states.first.id}
      expect(response).to redirect_to(@states.first)
    end
    it 'should return an error if state name is blank' do
      put "/states/#{@states.first.id}", params:{"state"=>{"name"=>""}, "commit"=>"Save", "id"=>@states.first.id}
      expect(response.body).to include("error prohibited this state from being saved")
    end
  end
end
