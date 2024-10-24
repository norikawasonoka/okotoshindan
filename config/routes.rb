# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#top'
  get 'terms', to: 'static_pages#terms'
  get '/before_login', to: 'static_pages#before_login'
  get '/after_login', to: 'static_pages#after_login', as: 'after_login'
  # LINEログイン関連のルーティング
  get 'line_login_api/login', to: 'line_login_api#login'
  get 'line_login_api/callback', to: 'line_login_api#callback'
  delete 'line_login_api/destroy', to: 'line_login_api#destroy'
  # LINEのWebhookイベントを受け取るエンドポイント
  post 'line_webhooks/callback', to: 'line_webhooks#callback'
  resources :okotos, only: %i[index] do
    collection do
      get 'plays'
    end
  end
  resources :diagnoses
  resources :results, only: %i[index new create show] do
    collection do
      get 'ranks'
    end
    resources :videos do
      resources :favorites, only: [:create, :destroy]
    end
  end
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
