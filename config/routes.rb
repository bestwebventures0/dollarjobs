Rails.application.routes.draw do
  root to: "listings#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :listings
  get 'categories/:category/listings' => "listings#index", as: :listings_by_category
  get 'companies/:company_name/listings' => "listings#index", as: :listings_by_company_name
  get 'industries/:industry/listings' => "listings#index", as: :listings_by_industry
  get 'about' => "pages#about", as: :pages_about
  get 'contact' => "pages#contact", as: :pages_contact
  get 'terms' => "pages#terms", as: :pages_terms
  get 'privacy' => "pages#privacy", as: :pages_privacy
  get "listings/:id/preview" => "listings#preview", as: :preview_job
  # route for payment via razorpay flash
  post '/purchase' => 'orders#purchase_status'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
