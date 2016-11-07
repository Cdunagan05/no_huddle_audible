Rails.application.routes.draw do

  #Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'



  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'search', to: 'searches#index'

  resources :sessions, only: [:create, :destroy]
  resources :home, only: [:show]
  resources :chatrooms, only: [:show], param: :id
  resources :messages, only: [:create]

  root to: "home#show"
end
