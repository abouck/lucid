Lucid::Application.routes.draw do
resources :articles
  root to: 'tweets#index'
  match 'auth/:provider/callback', to: 'sessions#create', via: 'get'
  match 'auth/failure', to: redirect('/'), via: 'get'
  match 'signout', to: 'sessions#destroy', as: 'signout', via: 'delete'
end
