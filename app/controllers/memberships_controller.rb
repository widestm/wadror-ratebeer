class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  # GET /memberships
  # GET /memberships.json
  def index
    @membership = Membership.all
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
  end

  # GET /memberships/new
  def new
    @membership = Membership.new
    @beer_clubs = BeerClub.all

  end

  # GET /memberships/1/edit
  def edit
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @membership = Membership.new(membership_params)
    @membership.user_id = current_user.id
    bc = BeerClub.find_by id:@membership.beer_club_id

    if bc.members.include? current_user
      redirect_to beer_clubs_path, notice: "You can only join the same Beer club once!"
    else
      respond_to do |format|
        if @membership.save
          format.html { redirect_to beer_club_path(bc.id), notice: "Welcome to the club, #{current_user.username}!" }
          format.json { render :show, status: :created, location: @membership }
        else
          format.html { render :new }
          format.json { render json: @membership.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to @membership, notice: 'Membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user.id), notice: 'Membership was successfully ended.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      params.require(:membership).permit(:user_id, :beer_club_id)
    end
  end
