Rails.application.routes.draw do
  root "videos#index"
  get "share", to: "videos#new"
  resources :videos, only: :create

  get "auth", to: "authentication#new"
  post "auth", to: "authentication#create"
  delete "auth", to: "authentication#destroy"

  get "share", to: "share#new"
end
