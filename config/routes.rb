Whatfailed::Application.routes.draw do
  
  root :to => "posts#index"
  
  # omniauth
    match "/signin" => "sessions#new", :as => :signin
    match "/auth/:provider/callback" => "sessions#create"
    match "/signout" => "sessions#destroy", :as => :signout
    match "/auth/failure", to: "sessions#failure"
    resources :identities
  
  # posts
    resources :votes
    resources :posts do
      post :vote_for, :on => :member
      post :vote_against, :on => :member
    end
  
  #login
    # match "/login" => "posts#login", :as => :login

  # tags
    get '/tags' => "tags#index"
    get '/tags/:id' => "tags#show", :as => :tag
end
