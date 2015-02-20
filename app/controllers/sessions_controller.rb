class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by username: params[:username]
		if user.frozen_account
			redirect_to :back, notice: "Your account is frozen :( Please contact an admin" and return
		end
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to user, notice: "Welcome back #{params[:username]}!"
		else
			redirect_to :back, notice: "Invalid credentials"
		end
	end
	def destroy
		session[:user_id] = nil

		redirect_to :root
	end
end