Lucid::Application.routes.draw do
resources :articles
get 'tweets/profilesearch' => 'tweets#profilesearch'
# get 'tweets/profiletweets' => 'tweets#profiletweets'
# get 'tweets/profilehome' => 'tweets#profilehome'
# get 'tweets/profilementions' => 'tweets#profilementions'
resources :tweets
resources :sessions, only: [:new, :create, :destroy]
resources :searches
get 'profilesearches/profiletweets' => 'profilesearches#profiletweets'
get 'profilesearches/profilehome' => 'profilesearches#profilehome'
get 'profilesearches/profilementions' => 'profilesearches#profilementions'
resources :profilesearches

  root 'tweets#index'

  match 'auth/:provider/callback', 	to: 'sessions#create', 					via: 'get'
  match 'profilesearches/profiletweets', 	to: 'profilesearches#show', 				via: 'get'
  
  match 'auth/failure', 			to: 'tweets#index', 					via: 'get'
  match 'signout', 					to: 'sessions#destroy', as: 'signout', 	via: 'delete'
end
