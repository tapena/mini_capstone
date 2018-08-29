Rails.application.routes.draw do
  namespace :api do
    get "/all_products_url" => "products#all_products_action"
  end  
end

  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namesace/controllers#action"
