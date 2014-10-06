Rails.application.routes.draw do
  root 'home#index'

  resources :softwares, path: "/software"

  get 'search(/:query)', to: "searches#index", as: :search
end
