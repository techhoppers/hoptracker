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
    get :autocomplete_user_username, :on => :collection
    resources :roles do
      get 'delete', :on => :member      
    end
    resources :milestones
    resources :issues do
      resources :issue_comments
    end
    resources :project_wikis
  end
   
  # Admin Urls
  match 'admin/projects' => 'admin#projects', :as => :admin_projects
  match 'admin/users' => "admin#users", :as => :admin_users

  match '/browse/:code' => "issues#show", :as => :issue

  root :to => 'home#index'

  # For all other routes show a custom error page
  #match "*path", :to => "application#render_not_found"

end
