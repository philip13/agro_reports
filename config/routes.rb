Rails.application.routes.draw do
  devise_for :users, path: "/", path_names: {sign_in: "login", sign_out: "logout", registration: "users"}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "accounts#show"
  resources :accounts
  resources :clients
  resources :collaborators, only: [:index]
  resources :invititation_resends, only: [:create]
end
