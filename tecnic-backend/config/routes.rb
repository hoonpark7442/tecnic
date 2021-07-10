Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                registrations: 'users/registrations'
             }
  post 'auth_user' => 'authentication#authenticate_user'       
  get '/member-data', to: 'members#test'

  resources :authors
  resources :posts
  resources :tags
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
