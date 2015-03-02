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
	def create_oauth
		user = User.find_by username: env["omniauth.auth"].info[:nickname]
		if user == nil
			user = User.new
			user.skip_password_validation = true

			user.github_token = env["omniauth.auth"].credentials[:token]
			user.password= env["omniauth.auth"].credentials[:token]
			user.username = env["omniauth.auth"].info[:nickname]
			user.admin = false
			user.frozen_account = false
			user.save
		end

		if user.frozen_account
			redirect_to :back, notice: "Your account is frozen :( Please contact an admin" and return
		end
		if user && user.authenticate(env["omniauth.auth"].credentials[:token])
			session[:user_id] = user.id
			redirect_to user, notice: "Welcome back #{user.username}!"
		else
			redirect_to :back, notice: "Invalid credentials"
		end

	end
end