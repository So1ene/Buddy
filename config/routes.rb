Rails.application.routes.draw do
  devise_for :users

  get '/events/pending', to: 'events#my_events', as: 'my_events'
  get '/events/:id/delete', to: 'events#delete', as: 'delete_event'

  resources :events, except: [:edit] do
    resources :requests, only: [:new, :create]
    resources :users, only: [] do
      resources :messages, only: [:create]
    end
  end
  get '/requests/submitted/:id', to: 'requests#submitted', as: 'submitted_request'
  get '/events/:event_id/requests/incoming', to: 'requests#incoming', as: 'incoming_requests'
  resources :requests, only: [:show, :update]

  get '/inbox', to: 'messages#index', as: 'messages'
  get '/inbox/:user_id', to: 'messages#new', as: 'new_message'

  get '/welcome', to: 'pages#welcome', as: 'welcome'
  get '/calendar', to: 'pages#calendar', as: 'calendar'
  patch '/', to: 'pages#update_location'

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

