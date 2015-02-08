class User < ActiveRecord::Base
	include RatingAverage

	has_secure_password

	has_many :ratings, dependent: :destroy
	has_many :beers, through: :ratings
	
	has_many :memberships, dependent: :destroy
	has_many :beer_clubs, through: :memberships

	validates :username, uniqueness: true, length: {minimum: 3, maximum: 15}
	validates :password, length: {minimum: 4}

	validates_format_of :password, :with => /(?=\w*\d)(?=\w*[A-Z])/	

	def favorite_beer
		return nil if ratings.empty?
		ratings.order(score: :desc).limit(1).first.beer
	end
end
