Rails.application.routes.draw do
  get 'profile_images/destroy'
  scope '(:locale)', locale: /es|en/ do
    get 'search/index', to: 'search#index'
    resources :vehicles
    resources :vehicle_models
    resources :fees
    devise_for :users
    resources :brands
    resources :profile_images, only: :destroy
    get '/my_vehicles', to: 'my_vehicles#index'
    root to: 'vehicles#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
