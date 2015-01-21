class Beer < ActiveRecord::Base
include RatingAverage

	belongs_to :brewery
	has_many :ratings, dependent: :destroy

	def to_s
		b = Brewery.find_by id:brewery.id
		"#{name}, #{b.name}"
		
	end
end
