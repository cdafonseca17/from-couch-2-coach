Rails.application.routes.draw do
  # get 'appointments/new'
  # get 'appointments/create'
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
       resources :appointments, only: [ :new, :create ]
     end
     get '/managecourses', to: 'pages#managecourses'
   end
