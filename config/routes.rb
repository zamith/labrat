Rails.application.routes.draw do
  root to: "pages#dashboard"

  resources :tubes, only: [:new, :create]
end
