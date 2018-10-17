Rails.application.routes.draw do
  root 'welcomes#index'

  resources :welcomes, only: :index
  resources :tops, only: :index
  resources :codes, only: :index
  resources :results, only: :show
  resources :lessons, only: [:index, :show]
  resources :sections, only: [:index, :show]
  resources :admins, only: [:index, :show]
  resources :questions, only: [:show, :new, :edit, :create, :update, :destroy]
  resources :categories, only: [:show, :new, :edit, :create, :update, :destroy]

  # adminページ用
  get 'answer/:id/:user_id', to: 'admins#answer', as: 'answer'
  get 'list/:id/', to: 'admins#list', as: 'list'

  # ログイン認証
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: "sessions#destroy", as: :signout

  # API
  namespace :api do
    namespace :v1 do
      get '/heatmap/index', to: 'heatmap#index'
      get '/heatmap/show/:id', to: 'heatmap#show'
      post '/compile/exec', to: 'compile#exec'
      post '/judgement/exec', to: 'judgement#exec'
      get '/information/result', to: 'information#result'
      get '/information/code', to: 'information#code'
      get '/information/all_code', to: 'information#all_code'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
