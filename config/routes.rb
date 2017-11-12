Rails.application.routes.draw do
  devise_for :users, path: "users", path_names: {
    sign_in: "login",
    sign_out: "logout",
    # password: "secret",
    # confirmation: "verification",
    # unlock: "unblock",
    # registration: "register",
    sign_up: "signup",
    settings: "edit"
  }
  devise_scope :user do
    get "login", to: "devise/sessions#new"
    get "signup", to: "devise/registrations#new"
    get "edit", to: "devise/registrations#edit"
    get "logout", to: "devise/sessions#destroy"
  end
  resources :users, except: :index

  root to: "users#new"
end
