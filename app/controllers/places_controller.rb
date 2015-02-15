class PlacesController < ApplicationController
  def index
  end

  def search
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

    places = Rails.cache.read session[:last_search]
    places.each do |p|
      if p.id == params[:id]
        @place = p
      end
    end  
  end
end