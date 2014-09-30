Rails.application.routes.draw do
  root 'home#index'

  get 'search(/:query)', to: "searches#index", as: :search
end
