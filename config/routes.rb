Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: %i[create destroy] do 
    member { get 'images' }
  end
  resources :sessions, only: [:create]
  get 'registration', to: 'users#new', as: 'registration'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :search, only: :index
  resources :images
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
