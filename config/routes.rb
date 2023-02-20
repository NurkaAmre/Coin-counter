Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resources :entities, only: [:index]
  resources :groups, only: [:index]
  resources :users, only: [:index]
  
  devise_scope :user do
    authenticated :user do
      root to: 'groups#index', as: :authenticated_root
    end
  end

    unauthenticated do
      root to: 'home#index'
    end
  end