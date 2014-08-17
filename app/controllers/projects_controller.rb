class ProjectsController < ApplicationController

  before_filter :set_project, :only => [:show, :team, :create_member, :delete_member, :update_member]
  
  layout "project", :except => [:new, :index, :create]

  def index

  end

  def new
    @project = Project.new
  end

  def show
    @tab = :show
  end

  def create
    @project = current_user.projects.new(params[:project])
    if @project.valid?
      @project.save
      flash[:success] = t(:create_success, :scope => [:projects])
      redirect_to project_path(@project)
    else
      render :action => :new
    end
  end

  def edit

  end

  def update

  end

  def delete
    
  end

  def team
    @tab = :team
    @project_users = @project.project_users
    @project_user = ProjectUser.new
    @project_roles = @project.project_roles
  end

  def create_member
    @user = User.find_by_username(params[:username])
    if @user.blank?
      flash[:error] = t(:wrong_username, :scope => [:projects])
      
    else
      @project_user = @project.project_users.new
      @project_user.user_id = @user.id
      @project_user.project_role_id = params[:role]
      @project_user.save
      flash[:success] = t(:member_creation_successfull, :scope => [:projects])
    end
    redirect_to team_project_path(@project)
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


end
