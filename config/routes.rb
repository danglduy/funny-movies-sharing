Rails.application.routes.draw do
  root "home#index"

  get "auth", to: "authentication#new"
  post "auth", to: "authentication#create"
  delete "auth", to: "authentication#destroy"

  get "share", to: "share#new"
end
