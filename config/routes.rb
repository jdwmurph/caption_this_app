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



#           Prefix Verb   URI Pattern                  Controller#Action
#                  GET    /                            welcome#index
#            users GET    /users(.:format)             users#index
#                  POST   /users(.:format)             users#create
#         new_user GET    /users/new(.:format)         users#new
#        edit_user GET    /users/:id/edit(.:format)    users#edit
#             user GET    /users/:id(.:format)         users#show
#                  PATCH  /users/:id(.:format)         users#update
#                  PUT    /users/:id(.:format)         users#update
#                  DELETE /users/:id(.:format)         users#destroy
#           images GET    /images(.:format)            images#index
#                  POST   /images(.:format)            images#create
#        new_image GET    /images/new(.:format)        images#new
#       edit_image GET    /images/:id/edit(.:format)   images#edit
#            image GET    /images/:id(.:format)        images#show
#                  PATCH  /images/:id(.:format)        images#update
#                  PUT    /images/:id(.:format)        images#update
#                  DELETE /images/:id(.:format)        images#destroy
#         captions GET    /captions(.:format)          captions#index
#                  POST   /captions(.:format)          captions#create
#      new_caption GET    /captions/new(.:format)      captions#new
#     edit_caption GET    /captions/:id/edit(.:format) captions#edit
#          caption GET    /captions/:id(.:format)      captions#show
#                  PATCH  /captions/:id(.:format)      captions#update
#                  PUT    /captions/:id(.:format)      captions#update
#                  DELETE /captions/:id(.:format)      captions#destroy
#   caption_upvote POST   /caption/upvote(.:format)    captions#upvote
# caption_downvote POST   /caption/downvote(.:format)  captions#downvote                                  users#destroy
end
