Rails.application.routes.draw do
  root to: 'pages#home'

  resources :aircrafts, only: [:index, :show]
  resources :users, except: :index do
    resources :aircrafts, except: [:index, :show] do
      resources :transactions, only: [ :create, :new ]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
