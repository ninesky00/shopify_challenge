Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: %i[create destroy]
  get 'dashboard', to: 'users#dashboard'
  resources :sessions, only: [:create]
  get 'registration', to: 'users#new', as: 'registration'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :images
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
