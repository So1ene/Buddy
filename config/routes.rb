Rails.application.routes.draw do
  devise_for :users

  get '/events/pending', to: 'events#my_events', as: 'my_events'
  get '/events/:id/delete', to: 'events#delete', as: 'delete_event'

  resources :events, except: [:edit, :update] do
    resources :requests, only: [:new, :create]
  end

  get '/requests/:id/submitted', to: 'requests#submitted', as: 'submitted_request'
  get '/requests/incoming', to: 'requests#incoming', as: 'incoming_requests'
  resources :requests, only: [:show, :update]

  get '/inbox', to: 'messages#index', as: 'messages'
  get '/inbox/:user_id', to: 'messages#new', as: 'new_message'
  post '/inbox', to: 'messages#create'

  get '/buddy/:user_id', to: 'pages#buddy', as: 'buddy'
  get '/welcome', to: 'pages#welcome', as: 'welcome'
  get '/calendar', to: 'pages#calendar', as: 'calendar'
  patch '/', to: 'pages#update_location'

  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

