Rails.application.routes.draw do
  get 'users/profile'
  resources :stories
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  # root '/users/sign_in', to: 'devise/sessions#new'
  get '/dashboard', to: 'dashboard#index'
  
  get '/u/:id', to: 'users#profile', as: 'user'
end
