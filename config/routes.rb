Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users, except: :index do
    resources :aircrafts do
      resources :transactions, only: [ :create, :new ]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
