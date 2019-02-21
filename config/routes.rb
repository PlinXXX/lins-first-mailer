Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :attendances
    resources :events

    root 'application#index'
  end
  get '/admin', to: 'admin#index'
  
  get 'home/index'
  get 'home/secret'
  devise_for :users, controllers: {
    events: 'users/events'
  }

  resources :users, only: [:show, :edit, :update] do
    resources :conversations
    resources :avatars, only: [:create]
  end

  resources :events do
    resources :images, only: [:create, :destroy]
    resources :likes
    resources :attendances  
  end 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
end
