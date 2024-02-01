class City < ApplicationRecord
  belongs_to :state
  
  scope :ordered_by_name, -> { reorder(name: :asc) }

  def states
    @states = State.all
  end

  def state
    State.find(self.states_id).name
  end

  def self.filter(city_params)
    params = city_params.to_hash
    return City.all.ordered_by_name if params["states_id"].blank? && params["name"].blank?
    @cities = City
    @cities = @cities.where(states_id:params["states_id"].to_i) unless params["states_id"].blank?
    @cities = @cities.where(sanitize_sql_array(["name like ? or name like ? or name like ?", "%#{params["name"]}%","#{params["name"]}%","%#{params["name"]}"])) unless params["name"].blank?
    
    @cities
  end
end
