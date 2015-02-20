class StylesController < ApplicationController
	before_action :is_admin, only: [:destroy]

	def index
		@styles = Style.all
	end

	def show
		@style = Style.find params[:id]
		@beers = Beer.where style_id:params[:id]
	end
end
