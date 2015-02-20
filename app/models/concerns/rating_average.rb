module RatingAverage
	extend ActiveSupport::Concern
	def average_rating
		if ratings.count == 0
			return 0
		end
			self.ratings.average(:score).round(1)
		end
	end