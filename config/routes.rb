Rails.application.routes.draw do
  scope '(:locale)', locale: /es|en/ do
    resources :vehicles
    resources :vehicle_models
    resources :fees
    devise_for :users
    resources :colors
    resources :brands
    get '/my_vehicles', to: 'my_vehicles#index'
    root to: 'vehicles#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
