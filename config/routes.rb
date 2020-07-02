Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/signup/:invitation_token', :controller => 'users', :action => 'new'

  resources :sessions
  resources :memberships
  resources :groups
  resources :users
  resources :invites
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
