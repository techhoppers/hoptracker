IssueTracker::Application.routes.draw do

  devise_for :users

  resources :users, :controller => "users" do
    get 'delete', :on => :collection
    get 'show', :on => :member
  end

  resources :projects do
    get 'team', :on => :member
    post 'create_member', :on => :member
    get 'delete_member', :on => :member
    put 'update_member', :on => :member
    resources :roles do
      get 'delete', :on => :member
    end
  end
   
  # Admin Urls
  match 'admin/projects' => 'admin#projects', :as => :admin_projects
  match 'admin/users' => "admin#users", :as => :admin_users

  root :to => 'home#index'

  # For all other routes show a custom error page
  #match "*path", :to => "application#render_not_found"

end
