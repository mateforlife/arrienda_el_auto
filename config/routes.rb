Rails.application.routes.draw do
  resources :vehicles
  resources :vehicle_models
  resources :fees
  devise_for :users
  resources :colors
  resources :brands
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/welcome', to: 'welcome#index'
  get '/my_vehicles', to: 'my_vehicles#index'
  root to: 'welcome#index'
end
