class RatingsController < ApplicationController
	def index
		@ratings = Rating.all
	end
	def new
		@rating = Rating.new
		@beers = Beer.all
	end
	def create
		rating = Rating.create params.require(:rating).permit(:score, :beer_id)

		session[:last_rating] = rating.to_s

		redirect_to ratings_path
	end
	def destroy
		rating = Rating.find(params[:id])
		rating.delete
		redirect_to ratings_path
	end
end