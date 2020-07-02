Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout' 
  resources :users
  resources :lines
  resources :followings, only [:new,:create,:destroy]
  resources :sessions, only: [:new,:create,:destroy]
  
  root "lines#index"
end
