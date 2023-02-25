Rails.application.routes.draw do
  get '/home', to: 'home#index', as: 'home'
  
  devise_for :users 
  resources :users, only: [:index, :show] do
    resources :groups do
      resources :entities
    end
  end
  
  root 'groups#index'
  end
  