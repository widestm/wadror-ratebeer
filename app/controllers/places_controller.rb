class PlacesController < ApplicationController
  def index
  end

  def search
    return redirect_to places_path, notice: "Please enter a city to search for" if params[:city] == "" 
    @places = BeermappingApi.places_in(params[:city])
    session[:last_search] = params[:city]
    if @places.empty?
      session[:last_search] = nil
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      render :index
    end
  end
  def show
    places = BeermappingApi.places_in( session[:last_search])
    places.each do |p|
      if p.id == params[:id]
        @place = p
      end
    end  
  end
end