Whatfailed::Application.routes.draw do
  
  root :to => "posts#index"
  
  # omniauth
    match "/auth/:provider/callback" => "sessions#create", :as => :signin
    match "/signout" => "sessions#destroy", :as => :signout
  
  # posts
    resources :posts
  
  # tags
    get '/tags' => "tags#index"
    get '/tags/:id' => "tags#show", :as => :tag
end
