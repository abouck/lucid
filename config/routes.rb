Lucid::Application.routes.draw do
resources :articles
resources :tweets
resources :sessions, only: [:new, :create, :destroy]
resources :searches
resources :ownsearches

  root 'tweets#index'
  match 'auth/:provider/callback', 	to: 'sessions#create', 					via: 'get'
  match 'auth/failure', 			to: 'tweets#index', 					via: 'get'
  match 'signout', 					to: 'sessions#destroy', as: 'signout', 	via: 'delete'
end
