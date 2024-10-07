json.extract! listing, :id, :title, :description, :category_id, :location, :how_to_apply, :company_name, :company_website, :company_email, :company_about, :highlight, :sticky, :logo_displayed, :created_at, :updated_at
json.url listing_url(listing, format: :json)
