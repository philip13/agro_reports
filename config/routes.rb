Rails.application.routes.draw do
  devise_for :users, path: "/", path_names: {sign_in: "login", sign_out: "logout", registration: "users"}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "accounts#show"
  resources :clients
  resource :account
end
