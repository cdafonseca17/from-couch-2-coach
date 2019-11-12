Rails.application.routes.draw do
  # get 'timeslots/index'
  # get 'timeslots/new'
  # get 'timeslots/create'
  # get 'timeslots/show'
  # get 'timeslots/edit'
  # get 'timeslots/update'
  # get 'timeslots/destroy'
  # get 'timeslots/date'
  # get 'timeslots/time'
  devise_for :users
  # root to: "home#index"

  # get 'reviews/create'
  root to: 'pages#home'
    resources :courses do
       resources :reviews, only: [ :new, :create ]
       resources :timeslots
     end
   end
