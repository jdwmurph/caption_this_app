Rails.application.routes.draw do

  get '/' => 'welcome#index'
  get '/rules' => 'welcome#rules'
  get '/rankings' => 'welcome#rankings'

  resources :users
  resources :images
  resources :captions

  get '/images/last_one' => 'images#last_one'
  post '/users/:user_id/captions/:id/upvote' => 'captions#upvote'
  post '/users/:user_id/captions/:id/downvote' => 'captions#downvote'
  put '/images/:id/update' => 'images#publisher'

  get '/sessions/new' => 'sessions#new', as: 'log_in'
  post '/sessions' => 'sessions#create'
  get '/sessions/end' => 'sessions#destroy', as: 'log_out'
end
