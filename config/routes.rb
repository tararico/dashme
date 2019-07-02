Rails.application.routes.draw do
  resources :buttons
  root to: redirect('/buttons')
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
