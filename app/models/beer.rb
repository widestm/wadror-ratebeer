class Beer < ActiveRecord::Base
	include RatingAverage

	belongs_to :brewery
	has_many :ratings, dependent: :destroy
	has_many :raters, -> {uniq}, through: :ratings, source: :user
	belongs_to :style
	
	validates :name, presence: true
	validates :style_id, presence: true

	def to_s
		b = Brewery.find_by id:brewery.id
		"#{name}, #{b.name}"
		
	end
end
