Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "rooms#index"
  
  resources :rooms, only: :index do
    resources :contact_books, shallow: true
  end

end
