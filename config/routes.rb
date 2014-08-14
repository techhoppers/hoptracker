IssueTracker::Application.routes.draw do

  devise_for :users

  resources :users, :controller => "users"
   
  # Admin Urls
  match 'admin' => 'admin#index'

  root :to => 'home#index'

  # For all other routes show a custom error page
  #match "*path", :to => "application#routing_error"

end
