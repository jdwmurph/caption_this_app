Rails.application.routes.draw do

  get '/' => 'welcome#index'

  post '/users/captions/' => 'captions#create'
  post '/users/:id/captions/:caption_id/upvote' => 'captions#upvote'
  post '/users/:id/captions/:caption_id/downvote' => 'captions#downvote'
end
