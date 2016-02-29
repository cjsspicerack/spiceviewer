ActiveAdmin.register Advert do
menu priority: 3

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :campaign, :campaign_id, :format, :files
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
	column :format
	column("Add Assets") { |advert| link_to("Add Assets", viewers_files_path(advert), :target => "_blank") }
	column("Launch Advert") { |advert| link_to("Launch", viewers_preview_path(id: advert, site: 'plain'), :target => "_blank") }
	actions
end

form(:html => { :multipart => true }) do |f|
  f.inputs do
	f.input :campaign
    f.input :format, as: :select, collection: ['250x300', '300x600', '160x600' ,'728x90']
    # f.file_field :files, multiple: true, name: "advert[files]"
  end
  f.submit
end


end
