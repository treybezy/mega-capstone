Rails.application.routes.draw do
   post 'user_token' => 'user_token#create'
   post "/users" => "users#create"
 namespace :api do  
 
  get '/discounts' => 'discounts#index'
  get '/discounts/new' => 'discounts#new'
  post '/discounts' => 'discounts#create'
  get '/discounts/:id' => 'discounts#show'
  get '/discounts/:id/edit' => 'discounts#edit'
  patch '/discounts/:id' => 'discounts#update'
  delete '/discounts/:id' => 'discounts#destroy'


  get '/locations' => 'locations#index'
  get '/locations/new' => 'locations#new'
  get '/locations/:id' => 'locations#show'
  post '/locations' => 'locations#create'
  delete '/locations/:id' => 'locations#destroy'
  
  post '/categories' => 'categories#create'
  get '/categories/:id' => 'categories#show'
  delete '/categories/:id' => 'categories#destroy'

  get '/location_discounts' => 'location_discounts#index'
end
end
