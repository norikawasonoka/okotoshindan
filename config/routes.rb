Rails.application.routes.draw do
  root "static_pages#top"
  resources :questions, only: %i[index create show] do
    collection do
      get :result
      get :next_question  # `next_question` アクションへのルート
      get :third_question # `third_question` アクションへのルート
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
