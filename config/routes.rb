Rails.application.routes.draw do
  root 'welcomes#index'

  resources :welcomes, only: :index
  resources :tops, only: :index
  resources :codes, only: :index
  resources :editors, only: :index
  resources :results, only: :show
  resources :lessons, only: [:index, :show]
  resources :sections, only: [:index, :show]
  resources :technicals, only: :index
  resources :code_golf_rankings, only: [:index, :show]

  # adminページ用
  resources :questions, only: [:show, :new, :edit, :create, :update, :destroy]
  resources :categories, only: [:show, :new, :edit, :create, :update, :destroy]
  resources :admins, only: :index

  get 'admins/answer/:id/:user_id', to: 'admins#answer', as: 'answer'
  get 'admins/list/:id/', to: 'admins#list', as: 'list'
  get 'admins/user/:id', to: 'admins#user', as: 'user'

  # ログイン認証
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: "sessions#destroy", as: :signout

  # API
  namespace :api do
    namespace :v1 do
      get '/user/period', to: 'user#period'
      get '/heatmap/index', to: 'heatmap#index'
      get '/heatmap/data/:year', to: 'heatmap#data'
      get '/heatmap/show/:id', to: 'heatmap#show'
      post '/compile/exec', to: 'compile#exec'
      post '/judgement/exec', to: 'judgement#exec'
      get '/information/state', to: 'information#state'
      get '/information/result', to: 'information#result'
      get '/information/code', to: 'information#code'
      get '/information/all_code', to: 'information#all_code'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
