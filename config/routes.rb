Rails.application.routes.draw do
  root 'welcomes#index'

  resources :welcomes, only: :index
  resources :codes, only: :index
  resources :lessons, only: [:index, :show]
  resources :admins, only: [:index, :show]
  resources :questions, only: [:show, :new, :edit, :create, :update, :destroy]
  resources :results, only: [:index, :show]

  get 'code/:id/:result_id', to: 'results#code', as: 'code'
  get 'answer/:id/:user_id', to: 'admins#answer', as: 'answer'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => "sessions#destroy", as: :signout

  namespace :api do
    namespace :v1 do
      post '/compile/exec' => 'compile#exec'
      post '/judgement/exec' => 'judgement#exec'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
