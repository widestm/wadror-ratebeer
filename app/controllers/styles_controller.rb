class StylesController < ApplicationController
	before_action :set_style, only: [:show, :edit, :update, :destroy]
	before_action :ensure_that_signed_in, except: [:index, :show]
	before_action :is_admin, only: [:destroy]

	def index
		@styles = Style.all
	end

	def show
		@style = Style.find params[:id]
		@beers = Beer.where style_id:params[:id]
	end
	def update
		respond_to do |format|
			if @style.update(style_params)
				format.html { redirect_to @style, notice: 'Style was successfully updated.' }
				format.json { render :show, status: :ok, location: @style }
			else
				format.html { render :edit }
				format.json { render json: @style.errors, status: :unprocessable_entity }
			end
		end
	end
	private
    # Use callbacks to share common setup or constraints between actions.
    def set_style
    	@style = Style.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def style_params
    	params.require(:style).permit(:name, :description)
    end
end
