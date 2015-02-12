class PlacesController < ApplicationController
	def index
	end

	def search
		api_key = "13935bcb4d39ddf2038744e65edc1ab4"
		url = 'http://stark-oasis-9187.herokuapp.com/api/'
    # tai vaihtoehtoisesti
    #url = "http://beermapping.com/webservice/loccity/#{api_key}/"

    response = HTTParty.get "#{url}#{ERB::Util.url_encode(params[:city])}"
    places_from_api = response.parsed_response["bmp_locations"]["location"]

    if places_from_api.is_a?(Hash) and places_from_api['id'].nil?
    	redirect_to places_path, :notice => "No places in #{params[:city]}"
    else
    	places_from_api = [places_from_api] if places_from_api.is_a?(Hash)
    	@places = places_from_api.inject([]) do | set, location|
    		set << Place.new(location)
    	end
    	render :index
    end
end

end