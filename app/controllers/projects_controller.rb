class ProjectsController < ApplicationController

  autocomplete :user, :username

  before_filter :set_project, :except => [:new, :index, :create, :autocomplete_user_username]
  before_filter :has_admin_rights, :only => [:edit, :update, :delete, 
    :create_member,:delete_member, :update_member]
  before_filter :has_member_rights, :only =>[:show]

  
  layout "project", :except => [:new, :index, :create]

  def index
    @user_projects = current_user.fetch_projects
  end

  def new
    @project = Project.new
    @user_projects = current_user.fetch_projects
  end

  def show
    @tab = :show
  end

  def create
    @tab = :projects
    @project = current_user.projects.new(params[:project])
    if @project.valid?
      @project.save
      flash[:success] = t(:create_success, :scope => [:projects])
      redirect_to project_path(@project)
    else
      # To load the projects in the navigation
      @user_projects = current_user.fetch_projects(5)
      flash[:error] = t(:create_failed, :scope => [:projects])
      render :action => :new
    end
  end

  def edit

  end

  def update
    if @project.update_attributes(params[:project])
      flash[:success] = t(:updation_success, :scope => [:projects])
      redirect_to project_path(@project)
    else
      flash[:error]= t(:updation_failed, :scope => [:projects])
      render :action => :edit
    end
  end

  def delete
    
  end

  def team
    @tab = :team
    set_team_defaults
  end

  def create_member
    @tab = :team
    if !params[:user].blank? && !params[:user][:username].blank?
      @user = User.find_by_username(params[:user][:username])
    end
    if @user.blank?
      flash[:error] = t(:wrong_username, :scope => [:projects])
      redirect_to team_project_path(@project)
    else
      @project_user = @project.project_users.new(:user_id => @user.id, :project_role_id => params[:role])
      if @project_user.valid?
        @project_user.save
        flash[:success] = t(:member_creation_successfull, :scope => [:projects])
        redirect_to team_project_path(@project)
      else
        set_team_defaults
        flash[:error] = t(:member_creation_failed, :scope => [:projects])
        render :action => :team
      end
    end
  end

  def delete_member
    @project_user = @project.project_users.find(params[:project_user_id])
    if @project_user.destroy
      flash[:success] = t(:member_deletion_success, :scope => [:projects])
    else
      flash[:error] = t(:member_deletion_failed, :scope => [:projects])
    end
    redirect_to team_project_path(@project)
  end

  def update_member
    @project_user = @project.project_users.find(params[:pk])
    if @project_user.update_attribute(:project_role_id, params[:value])
      render :noting => true
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_team_defaults
    @project_users = @project.project_users
    @project_user = ProjectUser.new
    @project_roles = @project.project_roles
  end

  def has_admin_rights
    unless current_user.has_admin_access(@project)
      render_401
    end
  end

  def has_member_rights
    unless current_user.has_member_access(@project)
      render_401
    end
  end


end
