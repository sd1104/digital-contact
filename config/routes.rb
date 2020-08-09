Rails.application.routes.draw do
  devise_for :schools, controllers: {
    sessions: 'schools/sessions',
    registrations: 'schools/registrations',
    passwords: 'schools/passwords'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

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
