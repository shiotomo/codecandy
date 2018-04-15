Rails.application.routes.draw do
  root 'welcomes#index'

  resources :welcomes, only: :index
  resources :codes, only: :index
  resources :lessons, only: [:index, :show]

  get 'present/:id', to: 'presentations#present', as: 'present'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => "sessions#destroy", as: :signout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
