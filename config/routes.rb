Rails.application.routes.draw do
  devise_for :schools, controllers: {
    sessions:      'schools/sessions',
    passwords:     'schools/passwords',
    registrations: 'schools/registrations'
  }
  resources :schools, only: :index
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
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
