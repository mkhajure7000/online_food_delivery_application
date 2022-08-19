Rails.application.routes.draw do
  
  root to: "users#index"
  resources :users, only: [:index, :new, :create]
  resources :restaurants, only: [:index]
  get 'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  delete 'logout' , to: 'sessions#destroy'
  get 'password' , to: 'passwords#new'
  post 'password' , to: 'passwords#create'
  get 'password/edit' , to: "passwords#edit"
  patch "password/edit" , to: "passwords#update"

end
