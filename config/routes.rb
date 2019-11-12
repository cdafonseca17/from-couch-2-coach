Rails.application.routes.draw do
  devise_for :users
  # root to: "home#index"

  get 'reviews/create'
  root to: 'pages#home'
    resources :courses do
       resources :reviews, only: [ :new, :create ]
     end
   end
