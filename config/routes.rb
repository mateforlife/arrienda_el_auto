Rails.application.routes.draw do
  resources :vehicle_models
  resources :fees
  devise_for :users
  resources :colors
  resources :brands
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/welcome', to: 'welcome#index'
  root to: 'welcome#index'
end
