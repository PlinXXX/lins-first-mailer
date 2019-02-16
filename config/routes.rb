Rails.application.routes.draw do
  get 'home/index'
  get 'home/secret'
  devise_for :users, controllers: {
    events: 'users/events'
  }

  scope "/admin" do
  	resources :users, only: [:show, :edit, :update]
  end
  resources :events do
    resources :attendances  
  end 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end