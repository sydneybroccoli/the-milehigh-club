Rails.application.routes.draw do
  # get 'aircrafts/index'
  # get 'aircrafts/show'
  # get 'aircrafts/new'
  # get 'aircrafts/create'
  # get 'aircrafts/edit'
  # get 'aircrafts/update'
  # get 'aircrafts/delete'
  root to: 'pages#home'

  resources :aircrafts do
    resources :transactions, only: [ :create, :new ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
