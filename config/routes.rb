Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, :only => [:show, :edit, :update]
  
  root to: 'pages#home'

  resources :aircrafts do
    resources :bookings, only: [ :create, :new ]
    resources :reviews, only: [ :create, :new ]
  end
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
