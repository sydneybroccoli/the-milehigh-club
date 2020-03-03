Rails.application.routes.draw do
  root to: 'pages#home'
  get 'aircrafts/index'
  get 'aircrafts/show'
  get 'aircrafts/new'
  get 'aircrafts/create'
  get 'aircrafts/edit'
  get 'aircrafts/update'
  get 'aircrafts/delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
