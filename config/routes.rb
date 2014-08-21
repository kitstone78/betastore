Betastore::Application.routes.draw do
  #resources :carts

  resources :subscriptions

  get '/products' => 'products#index'
  get '/customers' => 'customers#index'
  get '/products/:id' => 'products#show', as: "product"

  post '/products/:product_id/add_to_cart' => 'carts#update', as: 'add_to_cart'
  get '/cart' => 'carts#show', as: 'cart'

  put '/order' => 'orders#update', as: 'order'

  get '/checkout' => 'orders#new', as: 'checkout'
  post '/checkout' => 'orders#create' 

  namespace :admin do
     resources :products
     resources :customers

  get '/login' => 'logins#new', as: 'logins'
  post '/login' => 'logins#create'

  root :to => 'products#index'
  end
end