Rails.application.routes.draw do
  root "infections#index"

  devise_for :users, only: %i[sessions registrations passwords]

  resources :bacteria
  resources :infections
end
