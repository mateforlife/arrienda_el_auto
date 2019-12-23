# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  scope '(:locale)', locale: /es|en/ do
    get 'search/index', to: 'search#index'
    resources :vehicles do
      resources :legal_documents
    end
    resources :vehicle_models
    resources :fees
    devise_for :users
    resources :users do
      resources :legal_documents
    end
    delete '/images/(:id)', to: 'images#destroy', as: :destroy_images
    resources :brands
    get '/my_vehicles', to: 'my_vehicles#index'
    get '/validate_legal_documents', to: 'validate_legal_documents#index'
    root to: 'vehicles#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
