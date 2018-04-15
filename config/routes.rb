Rails.application.routes.draw do
  root 'welcomes#index'

  resources :welcomes, only: [:index]
  resources :codes, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
