class RolesController < ApplicationController

  before_filter :set_project
  layout "project"

  def index
    @tab = :roles
    @project_roles = @project.project_roles
    @project_role = ProjectRole.new
  end

  def create
    @project_role = @project.project_roles.new(params[:project_role])
    if @project_role.valid?
      @project_role.save
      flash[:success] = t(:role_creation_successfull, :scope => [:roles])
      redirect_to project_roles_path(@project)
    else
      flash[:error] = t(:role_creation_failed, :scope => [:roles])
      render :action => :index
    end
  end

  def update
    @project_role = @project.project_roles.find(params[:id])
    if @project_role.update_attribute(:role, params[:value])
      render :action => :index
    end
  end

  def delete
    @project_role = @project.project_roles.find(params[:id])
    if @project_role.destroy
      flash[:success] = t(:role_deletion_success, :scope => [:roles])
    else
      flash[:error] = t(:role_deletion_failed, :scope => [:roles])
    end
    redirect_to project_roles_path(@project)
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])

  end
end
