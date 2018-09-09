Rails.application.routes.draw do

  post "/users" => "users#create"
  namespace :api do
    get 'users/name'
    get 'users/email'
    get 'users/password_digest'
  end
  namespace :api do
    get "/products" => 'products#index'
    post "products/" => 'products#create'
    get "/products/:id" => 'products#show'
    patch "/products/:id" => 'products#update'
    delete "/products/:id" => 'products#destroy'
  end  
end

