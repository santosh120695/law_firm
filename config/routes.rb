Rails.application.routes.draw do
  resources :payment_modes
  resources :status_masters
  resources :pricing_details
  resources :titles,constraints: { id: /[a-zA-Z0-9]+/ } do 
    resources :payment_statuses
    member do 
      post 'status_update'
    end
  end
  resources :clients
  root 'home#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
