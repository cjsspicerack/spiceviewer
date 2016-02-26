ActiveAdmin.register Client do
menu priority: 4 

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :logo, :emails
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
	selectable_column
	id_column
	column "Logo" do |client|
		image_tag client.logo.url, class: "client-logo"
	end
	column :name
	column("Campaigns") { |client| client.campaigns.count }
	column :created_at
	actions
end

form(:html => { :multipart => true }) do |f|
	f.inputs do
		f.input :name
		f.input :logo, :as => :file
		f.input :emails
	end
	f.submit
end


end
