class ViewersController < ApplicationController
	before_action :lock_check, except: [:lock, :unlock]

	def lock
		@campaign = Campaign.find(params[:id])
		@auth = ""
	end

	def unlock
		if Campaign.find(params[:id]).client.emails.include? params[:email]
			session[:spiceviewer] = Hash.new
			session[:spiceviewer][:current_user] = params[:email]
			session[:spiceviewer][:expiry] = DateTime.now + 24.hours
		end
		redirect_to viewers_select_path(params[:id])
	end

	def select
		@campaign = Campaign.find(params[:id])
	end

	def preview
	end

	private

	def lock_check
		if session[:spiceviewer].present? == false
			redirect_to viewers_lock_path(params[:id])
		end
	end

end
