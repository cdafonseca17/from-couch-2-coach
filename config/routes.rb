Rails.application.routes.draw do
  get 'reviews/create'
  root to: 'pages#home'
    resources :courses do
       resources :reviews, only: [ :new, :create ]
     end
   end
