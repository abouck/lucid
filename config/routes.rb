Lucid::Application.routes.draw do
  get 'tweets/search' => 'tweets#search'
resources :tweets
resources :sessions, only: [:new, :create, :destroy]
  get 'searches/search' => 'searches#search'
resources :searches
  get 'profilesearches/profiletweets' => 'profilesearches#profiletweets'
  get 'profilesearches/profilehome' => 'profilesearches#profilehome'
  get 'profilesearches/profilementions' => 'profilesearches#profilementions'
resources :profilesearches
 
  root 'staticpages#home'

  match 'auth/:provider/callback', 	to: 'sessions#create', 					via: 'get'
  match 'auth/failure', 			to: 'tweets#index', 					via: 'get'
  match 'signout', 					to: 'sessions#destroy', as: 'signout', 	via: 'delete'
end
