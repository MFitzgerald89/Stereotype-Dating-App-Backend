Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/sessions" => "sessions#create"

  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
  get "/users/:id" => "users#show"
  delete "/users/:id" => "users#destroy"

end
