Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "rooms#index"
  
  resources :rooms, only: :index do
    resources :contact_books, only: [:index, :new, :create, :show]
    resources :letters, only:[:index, :new, :create]
    resources :absent_contacts, only: [:index, :create]
  end

end
