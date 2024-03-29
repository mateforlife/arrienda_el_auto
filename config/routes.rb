# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  scope '(:locale)', locale: /es|en/ do
    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :vehicles do
      put :enable
      put :disable
      resources :legal_documents, except: :destroy
      resources :reservations
    end
    resources :reservations, only: :index do
      resources :payments, except: :destroy
    end
    resources :users, except: :destroy do
      resources :legal_documents, except: :destroy
      resources :driver_accounts, path: :driver, except: %i[destroy index]
    end
    resources :driver_accounts, path: :driver, only: :index do
      resources :legal_documents, except: :destroy
    end
    resources :vehicle_models, except: :destroy
    resources :fees, except: :destroy
    resources :brands, except: :destroy
    delete '/images/(:id)', to: 'images#destroy', as: :destroy_images
    get 'search/index', to: 'search#index'
    get 'my_reservations', to: 'my_reservations#index'
    get '/my_vehicles', to: 'my_vehicles#index'
    get '/validate_legal_documents', to: 'validate_legal_documents#index'
    get '/welcome', to: 'welcome#index'
    get 'my_vehicles_reservations', to: 'my_vehicles_reservations#index'
    root to: 'welcome#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
