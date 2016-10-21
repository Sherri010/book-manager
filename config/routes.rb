Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, only:[:create]

  get "/signup" => "users#new"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create", as: "sessions"
end
