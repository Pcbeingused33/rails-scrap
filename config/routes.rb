Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "content_creators#index"
  get "add_content_creator", to: "content_creators#add_content_creator"
  post "add_content_creator", to: "content_creators#create"
  # get "content_creators", to: "content_creators#index"
  # get "content_creators/new", to: "content_creators#new"
  # get "content_creators/:id", to: "content_creators#show"
  # post "content_creators/", to: "content_creators#create"

end
