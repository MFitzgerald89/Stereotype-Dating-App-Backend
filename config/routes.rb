Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/sessions" => "sessions#create"

  post "/users" => "users#create"
  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  post "/genres" => "genres#create"
  get "/genres/:id" => "genres#show"
  get "/genres" => "genres#index"
  patch "/genres/:id" => "genres#update"
  delete "/genres/:id" => "genres#destroy"

  post "/bands" => "bands#create"
  get "/bands/:id" => "bands#show"
  get "/bands" => "bands#index"
  patch "/bands/:id" => "bands#update"
  delete "/bands/:id" => "bands#destroy"

  post "/songs" => "songs#create"
  get "/songs/:id" => "songs#show"
  get "/songs" => "songs#index"
  patch "/songs/:id" => "songs#update"
  delete "/songs/:id" => "songs#destroy"

  post "/lyrics" => "lyrics#create"
  get "/lyrics/:id" => "lyrics#show"
  get "/lyrics" => "lyrics#index"
  patch "/lyrics/:id" => "lyrics#update"
  delete "/lyrics/:id" => "lyrics#destroy"

  post "/matches" => "matches#create"
  get "/matches/:id" => "matches#show"
  get "/matches" => "matches#index"
  patch "/matches/:id" => "matches#update"
  delete "/matches/:id" => "matches#destroy"

end
