ActiveAdmin.register Listing do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :title, :description, :category_id, :location, :how_to_apply, :company_name, :company_website, :company_email, :company_about, :highlight, :sticky, :logo_displayed, :industry, :paid, :expired

end
