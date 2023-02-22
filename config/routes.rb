Rails.application.routes.draw do
  get '/home', to: 'home#index', as: 'home'
  get 'entities/new'
  get 'entities/destroy'
  get 'entities/edit'
  get 'entities/update'
  get 'entities/index'
  devise_for :users 
  # controllers: { registrations: "users/registrations" }
  resources :users, only: [:index, :show] do
    resources :groups do
      resources :entities
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root 'groups#index'
  end
  