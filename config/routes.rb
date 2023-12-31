Rails.application.routes.draw do
  get 'posts/create'
  get 'posts/index'
  get 'posts/update'
  get 'posts/destroy'
  get 'users/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
resources :users, only: [:create]
resources :posts, only: [:create, :index, :update, :destroy]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
