class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users
  # GET /users.json
  def index
    @users = User.includes(:beers, :ratings).all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @confirmed_clubs = @user.confirmed_clubs
    @unconfirmed_clubs = @user.unconfirmed_clubs
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.admin = false
    @user.frozen_account = false

    respond_to do |format|
      if @user.save
        format.html { redirect_to new_session_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if user_params[:username].nil? and @user == current_user and @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if (current_user.id == @user.id)
     session[:user_id] = nil 
     @user.destroy
     respond_to do |format|
      format.html { redirect_to breweries_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
def toggle_frozen_status
  user = User.find(params[:id])
  user.update_attribute :frozen_account, (not user.frozen_account)

  new_status = user.frozen_account? ? "Frozen" : "Active"

  redirect_to :back, notice:"User status changed to #{new_status}"
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :frozen_account, :github_token)
    end
  end
