Rails.application.routes.draw do

  root 'chat_rooms#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users
  post 'message', to: 'messages#create'

  mount ActionCable.server, at: '/cable'
end
