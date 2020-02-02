Rails.application.routes.draw do
  get   '/signout',   to: 'users#new',  as: :signout
  post   '/signout',   to: 'users#create'
  get   '/login',   to: 'user_sessions#new',  as: :login
  post   '/login',   to: 'user_sessions#create'
  delete '/logout',  to: 'user_sessions#destroy', as: :logout
  get '/about', to: 'home#about'
  resources :users, except: :index
  resources :families, only: [:show]
  resources :invitations, only: [:create, :edit, :update, :show]
  resources :family_invitations, only: [:edit, :update]
  resources :buttons
  resources :slack_workspaces
  root to: 'buttons#index'
  resources :items
  resources :password_resets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
