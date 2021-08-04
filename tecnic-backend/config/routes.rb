Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                registrations: 'users/registrations'
             }
  post 'auth_user' => 'authentication#authenticate_user'
  get '/member-data', to: 'members#test'

  resources :authors, only: [:index, :show] do
    resources :posts
  end
  
  resources :posts do
    resources :read_marks, only: [:create, :destroy]  
  end
  
  resources :tags
  resources :subscriptions, only: [:create, :destroy]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
