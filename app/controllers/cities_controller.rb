# frozen_string_literal: true

# Controller for City domain
class CitiesController < ApplicationController
  before_action :set_city, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  # GET /cities or /cities.json
  def index
    @cities = City.all.paginate(page: params[:page]).ordered_by_name
  end

  # GET /cities/1 or /cities/1.json
  def show; end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit; end

  # POST /cities or /cities.json
  def create
    @city = City.new(city_params)
    respond_to do |format|
      if @city.save
        format.html { redirect_to cities_url(@city), notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1 or /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to cities_url(@city), notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1 or /cities/1.json
  def destroy
    @city.destroy

    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /cities/search
  def search
    @cities = if city_params.present?
                City.filter(city_params).paginate(page: params[:page]).ordered_by_name
              else
                City.all.paginate(page: params[:page]).ordered_by_name
              end
    render template: 'cities/index'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_city
    @city = City.find(params[:id])
  end

  # render not_found if City not found
  def render_not_found
    redirect_to '/404'
  end

  # Only allow a list of trusted parameters through.
  def city_params
    params.require(:city).permit(:id, :name, :states_id, :page)
  end
end
