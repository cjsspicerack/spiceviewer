class ViewersController < ApplicationController
	before_action :lock_check, except: [:lock, :unlock, :files, :files_update]

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
		@advert = Advert.find(params[:id])
		formatIndex = ["250x300", "300x600", "160x600", "729x90"].find_index(@advert.format)
		formatClasses = ["fOne", "fTwo", "fThree", "fFour"]
		@formatClass = formatClasses[formatIndex]
	end

	def files
		@advert = Advert.find(params[:id])
	end

	def files_update
		if Advert.find(params[:id]).update(files: params[:advert][:files])
			redirect_to viewers_files_path(params[:id])
		end
	end
	
	private

	def assets_params
		params.require(:advert).permit({files: []})
	end

	def lock_check
		if session[:spiceviewer].present? == false
			redirect_to viewers_lock_path(params[:id])
		end
	end

end
