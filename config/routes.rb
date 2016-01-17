Rails.application.routes.draw do
  root to: "pages#dashboard"

  resources :tubes, except: [:index]
end
