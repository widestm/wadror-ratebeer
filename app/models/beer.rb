class Beer < ActiveRecord::Base
	belongs_to :brewery
	has_many :ratings

	def average_rating
		# total_score = 0.0
		# self.ratings.each do |rat|
		# 	total_score += rat.score
		# end
		# avg_rating = 0.0
		# avg_rating = total_score/self.ratings.count
		# avg_rating.round(2)
		
		self.ratings.average(:score).round(2)
	end
end
