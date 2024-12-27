Rails.application.routes.draw do
  root "users#new"
  get "/signup",  to: "users#new"
  post "/signup", to: "users#create"
  resources :acccount_activations, only: [:edit]
end
