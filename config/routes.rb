Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
#  root "mains#routes"
  root "mains#index"
  resources :users
  resources :mains
  resources :restaurants
  get 'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  delete 'logout' , to: 'sessions#destroy'
  get 'password/reset' , to: 'password_resets#new'
  post 'password/reset' , to: 'password_resets#create'
  get 'password/reset/edit' , to: "password_resets#edit"
  patch "password/reset/edit" , to: "password_resets#update"
end
