Whatfailed::Application.routes.draw do
  
  root :to => "posts#index"
  
  # omniauth
    match "/auth/:provider/callback" => "sessions#create", :as => :signin
    match "/signout" => "sessions#destroy", :as => :signout
  
  # posts
    resources :votes
    resources :posts do
      post :vote_for, :on => :member
      post :vote_against, :on => :member
    end

    match "/feed" => "posts#feed",
      :as => :feed,
      :defauts => { :format => 'rss' }
  
  # tags
    get '/tags' => "tags#index"
    get '/tags/:id' => "tags#show", :as => :tag
end
