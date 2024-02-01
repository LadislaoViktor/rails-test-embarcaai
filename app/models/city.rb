class City < ApplicationRecord
  belongs_to :state, optional: true
  # self.per_page = 10  

  def states
    @states = State.all
  end

  def state
    State.find(self.states_id).name
  end

  def self.filter(city_params)
    params = city_params.to_hash
    return City.all if params["states_id"].blank? && params["name"].blank?
    @cities = City
    @cities = @cities.where(states_id:params["states_id"].to_i) unless params["states_id"].blank?
    @cities = @cities.where("name like ? or name like ? or name like ?", "%#{params["name"]}%","#{params["name"]}%","%#{params["name"]}") unless params["name"].blank?
    
    @cities
  end
end
