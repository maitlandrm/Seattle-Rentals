Rails.application.routes.draw do
  root 'main#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  post 'sessions' => 'sessions#create_new'

  delete 'logout', to: 'sessions#destroy'

  get 'landlords' => 'landlords#index'
  get 'landlords/new' => 'landlords#new'
  post '/landlords' => 'landlords#create'


  get 'tenants' => 'tenants#index'
  get 'tenants/new' => 'tenants#new'
  post 'tenants' => 'tenants#create'

  get 'listings' => 'listings#index'
  get 'listings/address' => 'listings#address'
  get 'listings/:id' => 'listings#show'
  patch 'listings/:id' => 'listings#update'
  post 'listings' =>'listings#create'
  post 'listings/find' => 'listings#find'
end
