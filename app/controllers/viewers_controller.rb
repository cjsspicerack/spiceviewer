class ViewersController < ApplicationController
	before_action :lock_check, except: [:lock, :unlock]

	def lock
		@auth = String.new
	end

	def unlock
		session[:current_user] = params[:email]
		redirect_to viewers_preview_path
	end

	def preview
	end

	private

	def lock_check
		unless session[:current_user].present?
			redirect_to viewers_lock_path
		end
	end

end
