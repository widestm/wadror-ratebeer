class RatingsController < ApplicationController


	def index
		@recent_ratings = Rails.cache.fetch('recent_ratings', expires_in: 10.minutes) {Rating.all.recent}

		@best_three_breweries = Rails.cache.fetch('best_three_breweries', expires_in: 10.minutes) {Brewery.top 3}

		@best_three_beers = Rails.cache.fetch('best_three_beers', expires_in: 10.minutes) {Beer.top 3}

		@best_three_styles = Rails.cache.fetch('best_three_styles', expires_in: 10.minutes) {Style.top 3}

		@most_active_users = Rails.cache.fetch('most_active_users', expires_in: 10.minutes) {User.most_active 3}

	end
	def new
		@rating = Rating.new
		@beers = Beer.all
	end
	def create
		@rating = Rating.new params.require(:rating).permit(:score, :beer_id)

		if current_user.nil?
			redirect_to signin_path, notice:'You have to sign in before you can rate a beer'
		elsif @rating.save
			current_user.ratings << @rating  
			redirect_to ratings_path
		else
			@beers = Beer.all
			render :new
		end
	end
	def destroy
		rating = Rating.find params[:id]
		rating.delete if current_user == rating.user
		redirect_to :back
	end
end