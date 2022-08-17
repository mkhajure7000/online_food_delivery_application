Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  get '/' => 'mains#index'
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "password/reset" => "password_resets#new"
  post "password/reset" => "password_resets#create"
  get "password/reset/edit" => "password_resets#edit"
  patch "password/reset/edit" => "password_resets#update"
  # resources :mains
  resources :restaurants
end
