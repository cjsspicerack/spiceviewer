ActiveAdmin.register Advert do
menu priority: 3

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :campaign_id, :format, {files: []}
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


form do |f|
  f.inputs do
	f.input :campaign
    f.input :format, as: :select, collection: ['250x300', '300x600', '160x600' ,'728x90']
    f.file_field :files, multiple: true, name: "advert[files]"
  end
  f.submit
end


end
