IssueTracker::Application.routes.draw do

  devise_for :users

  resources :users, :controller => "users" do
    get 'delete', :on => :collection
  end
   
  # Admin Urls
  match 'admin/projects' => 'admin#projects', :as => :admin_projects
  match 'admin/users' => "admin#users", :as => :admin_users

  root :to => 'home#index'

  # For all other routes show a custom error page
  #match "*path", :to => "application#render_not_found"

end
