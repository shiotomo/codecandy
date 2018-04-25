Rails.application.routes.draw do
  root 'welcomes#index'

  resources :welcomes, only: :index
  resources :codes, only: :index
  resources :lessons

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => "sessions#destroy", as: :signout

  namespace :api do
    namespace :v1 do
      post '/compile/exec' => 'compile#exec', as: 'api/v1/compile'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
