ActiveAdmin.register Campaign do
menu priority: 2

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :client, :client_id, :name
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
	column :name
	column("Link") { |campaign| url_for(viewers_select_path(campaign)) }
	column :client
	column("Adverts") { |campaign| campaign.adverts.count }
	column("Launch Campaign") { |campaign| link_to("Launch", viewers_select_path(campaign), :target => "_blank") }
	actions
end

end
