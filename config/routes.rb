Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :messages, only: [:index, :create]
  root 'messages#index'

# Conversations routes
  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end


  resources :users, only: [:new, :create, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :conversations, only: [:index, :show, :create]
end
