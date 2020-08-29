Rails.application.routes.draw do
  devise_for :schools, controllers: {
    sessions:      'schools/sessions',
    passwords:     'schools/passwords',
    registrations: 'schools/registrations'
  }
  resources :schools, only: :index do
    collection do
      get 'users_control'
    end
  end
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get "users/registrations/new_teacher"
    post "users/registrations/create_teacher"
    get "users/registrations/new2"
    patch "users/registrations/room_select"
  end

  root "rooms#index"
  
  resources :users, only: :destroy
  resources :rooms do
    collection do
      get 'control'
      get 'confirm'
      get 'room_edit'
      get 'room_show'
    end
    resources :contact_books
    resources :letters, only:[:index, :new, :create, :destroy]
    resources :absent_contacts, only: [:index, :create, :edit, :update, :destroy] do
      collection do
        patch 'absent_contact_t_checked' 
      end
    end
  end
end