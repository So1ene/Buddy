Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get '/welcome', to: 'pages#welcome', as: 'welcome'
  get '/buddy/:user_id', to: 'pages#buddy', as: 'buddy'

  resources :events, except: [:edit, :update] do
    resources :requests, only: [:new, :create]
  end
  get '/events/:id/delete', to: 'events#delete', as: 'delete_event'
  get '/calendar', to: 'pages#calendar', as: 'calendar'

  resources :requests, only: [:show, :update]
  get '/requests/:id/submitted', to: 'requests#submitted', as: 'submitted_request'
  get '/requests/incoming', to: 'requests#incoming', as: 'incoming_requests'

  get '/inbox', to: 'messages#index', as: 'messages'
  get '/inbox/:user_id', to: 'messages#new', as: 'new_message'
  post '/inbox', to: 'messages#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
