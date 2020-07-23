Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "months#index"
  resources :rooms, only: :index
  resources :contact_books, only: :index
  resources :months, only: :index
end
