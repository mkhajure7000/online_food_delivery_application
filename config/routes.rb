Rails.application.routes.draw do
  
  root to: "users#index"
  resources :users, only: %i[index new create]
  resources :sessions, only: %i[new create destroy]
  resources :restaurants
  resources :foods, only: [:index ,:show]
  get 'password' , to: 'passwords#new'
  post 'password' , to: 'passwords#create'
  get 'password/edit' , to: "passwords#edit"
  patch "password/edit" , to: "passwords#update"

end
