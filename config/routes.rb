Rails.application.routes.draw do
  root "bacteria#index"

  devise_for :users, only: %i[sessions registrations passwords]

  resources :bacteria
end
