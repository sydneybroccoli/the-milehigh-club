Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  resources :users, :only => [:show, :edit, :update]
=======
>>>>>>> 67d894d8c0c6782563134c9ff2523321b6b0b319

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, :only => [:show]
  
  root to: 'pages#home'

  resources :aircrafts do
    resources :bookings, only: [ :create, :new ]
    resources :reviews, only: [ :create, :new ]
  end
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
