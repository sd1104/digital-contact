Rails.application.routes.draw do
  devise_for :schools, controllers: {
    sessions:      'schools/sessions',
    passwords:     'schools/passwords',
    registrations: 'schools/registrations'
  }
  resources :schools, only: :index do
    collection do
      get 'room_control'
    end
  end
  resources :users, only: :index
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  
  root "rooms#index"
  
  resources :rooms, only: [:index, :new, :create, :show] do
    collection do
      get 'grade1'
      get 'grade2'
      get 'grade3'
      get 'grade4'
      get 'grade5'
      get 'grade6'
      get 'grade7'
      get 'end'
      post 'grade1_post'
      post 'grade2_post'
      post 'grade3_post'
      post 'grade4_post'
      post 'grade5_post'
      post 'grade6_post'
      post 'grade7_post'
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