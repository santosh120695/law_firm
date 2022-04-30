Rails.application.routes.draw do
  resources :dastavejs do 
    member do 
      post 'dastavej_status_update'
    end
  end
  resources :projects do 
    member do 
      get 'get_towers'
    end
    collection do 
      post 'add_towers'
      get 'get_floors'
      get 'towers_new'
    end
  end
  resources :units
  resources :payment_modes
  resources :status_masters
  resources :pricing_details
  resources :titles,constraints: { id: /[a-zA-Z0-9]+/ } do 
    resources :payment_statuses
    member do 
      post 'status_update'
      post 'add_files'
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
