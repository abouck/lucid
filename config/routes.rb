Lucid::Application.routes.draw do
resources :articles
get 'tweets/profiletweets' => 'tweets#profiletweets'
get 'tweets/profilehome' => 'tweets#profilehome'
get 'tweets/profilementions' => 'tweets#profilementions'
resources :tweets
resources :sessions, only: [:new, :create, :destroy]
resources :searches
get 'ownsearches/user_tweets' => 'ownsearches#user_tweets'
get 'ownsearches/home_tweets' => 'ownsearches#user_home_tweets'
get 'ownsearches/user_mentions' => 'ownsearches#user_mentions'
resources :ownsearches

  root 'tweets#index'

  match 'auth/:provider/callback', 	to: 'sessions#create', 					via: 'get'
  match 'ownsearches/owntimeline', 	to: 'ownsearches#show', 				via: 'get'
  
  match 'auth/failure', 			to: 'tweets#index', 					via: 'get'
  match 'signout', 					to: 'sessions#destroy', as: 'signout', 	via: 'delete'
end
