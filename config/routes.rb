Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "rooms#index"
  
  resources :rooms, only: [:index, :show] do
    resources :contact_books
    resources :letters, only:[:index, :new, :create, :destroy]
    resources :absent_contacts, only: [:index, :create, :edit, :update, :destroy] do
      collection do
        patch 'absent_contact_t_checked' 
      end
    end
  end

end
