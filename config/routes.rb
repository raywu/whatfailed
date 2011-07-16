Whatfailed::Application.routes.draw do
  
  root :to => "posts#index"
  
  match "/auth/:provider/callback" => "sessions#create", :as => :signin
  match "/signout" => "sessions#destroy", :as => :signout
  
  resources :tags
  resources :posts
end
