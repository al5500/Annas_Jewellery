# == Route Map
#
#         Prefix Verb   URI Pattern                    Controller#Action
#           root GET    /                              categories#index
#     line_items GET    /line_items(.:format)          line_items#index
#                POST   /line_items(.:format)          line_items#create
#  new_line_item GET    /line_items/new(.:format)      line_items#new
# edit_line_item GET    /line_items/:id/edit(.:format) line_items#edit
#      line_item GET    /line_items/:id(.:format)      line_items#show
#                PATCH  /line_items/:id(.:format)      line_items#update
#                PUT    /line_items/:id(.:format)      line_items#update
#                DELETE /line_items/:id(.:format)      line_items#destroy
#          carts GET    /carts(.:format)               carts#index
#                POST   /carts(.:format)               carts#create
#       new_cart GET    /carts/new(.:format)           carts#new
#      edit_cart GET    /carts/:id/edit(.:format)      carts#edit
#           cart GET    /carts/:id(.:format)           carts#show
#                PATCH  /carts/:id(.:format)           carts#update
#                PUT    /carts/:id(.:format)           carts#update
#                DELETE /carts/:id(.:format)           carts#destroy
#       products GET    /products(.:format)            products#index
#                POST   /products(.:format)            products#create
#    new_product GET    /products/new(.:format)        products#new
#   edit_product GET    /products/:id/edit(.:format)   products#edit
#        product GET    /products/:id(.:format)        products#show
#                PATCH  /products/:id(.:format)        products#update
#                PUT    /products/:id(.:format)        products#update
#                DELETE /products/:id(.:format)        products#destroy
#     categories GET    /categories(.:format)          categories#index
#                POST   /categories(.:format)          categories#create
#   new_category GET    /categories/new(.:format)      categories#new
#  edit_category GET    /categories/:id/edit(.:format) categories#edit
#       category GET    /categories/:id(.:format)      categories#show
#                PATCH  /categories/:id(.:format)      categories#update
#                PUT    /categories/:id(.:format)      categories#update
#                DELETE /categories/:id(.:format)      categories#destroy
#          users GET    /users(.:format)               users#index
#                POST   /users(.:format)               users#create
#       new_user GET    /users/new(.:format)           users#new
#      edit_user GET    /users/:id/edit(.:format)      users#edit
#           user GET    /users/:id(.:format)           users#show
#                PATCH  /users/:id(.:format)           users#update
#                PUT    /users/:id(.:format)           users#update
#                DELETE /users/:id(.:format)           users#destroy
#          login GET    /login(.:format)               session#new
#                POST   /login(.:format)               session#create
#                DELETE /login(.:format)               session#destroy
#

Rails.application.routes.draw do

  root :to => 'pages#landing'

  resources :line_items
  resources :carts
  resources :products
  resources :categories
  resources :users
  resources :password_resets

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/about' => 'pages#about'
end
