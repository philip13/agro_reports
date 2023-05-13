Rails.application.routes.draw do
  devise_for :users, path: "/", path_names: {sign_in: "login", sign_out: "logout", registration: "users"}
  resources :invititation_resends, only: [:create]

  root "accounts#show"
  resources :accounts do
    resources :clients
    resources :collaborators, only: [:index]
  end
end
