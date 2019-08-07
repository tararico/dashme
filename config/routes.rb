Rails.application.routes.draw do
  get   '/signout',   to: 'users#new',  as: :signout
  post   '/signout',   to: 'users#create'
  resources :users, only: [:new, :create]
  resources :buttons
  root to: 'buttons#index'
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
