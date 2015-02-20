class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :is_member
  helper_method :is_admin

  def is_member
    Membership.find_by user_id:current_user.id, beer_club_id:params[:id]
  end


  def current_user
  	return nil if session[:user_id].nil?
  	User.find(session[:user_id])
  end
  def ensure_that_signed_in
    redirect_to signin_path, notice:'you should be signed in' if current_user.nil?
  end
  def is_admin
    redirect_to :back, notice:"Only users with admin right can delete content" if current_user.admin == false || nil
  end
end
