Rails.application.routes.draw do
  devise_for :users

  resources :events, except: [:edit, :update] do
    resources :requests, only: [:new, :create]
  end

  get '/events/:id/delete', to: 'events#delete', as: 'delete_event'


  get '/requests/incoming', to: 'requests#incoming', as: 'incoming_requests'
  resources :requests, only: [:show, :update]
  get '/requests/:id/submitted', to: 'requests#submitted', as: 'submitted_request'

  get '/messages', to: 'messages#index', as: 'messages'
  get '/messages/:user_id', to: 'messages#new', as: 'new_message'
  post '/messages', to: 'messages#create'

  get '/buddy/:user_id', to: 'pages#buddy', as: 'buddy'

  get '/welcome', to: 'pages#welcome', as: 'welcome'
  get '/calendar', to: 'pages#calendar', as: 'calendar'
  patch '/', to: 'pages#update_location'

  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

