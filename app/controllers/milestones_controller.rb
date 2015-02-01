class MilestonesController < ApplicationController

  before_filter :set_project
  before_filter :has_member_rights
  before_filter :set_tab
  
  layout "project"

  def index
    @milestones = @project.milestones
  end

  def new
    @milestone = @project.milestones.new
  end

  def create
    @milestone = @project.milestones.new(params[:milestone])
    if @milestone.save
      flash[:success] = t(:milestone_creation_success, :scope => [:milestones])
      redirect_to project_milestones_path(@project)
    else
      flash[:error]= t(:milestone_creation_failed, :scope => [:milestones])
      render :action => :new
    end
  end

  def edit
    @milestone = @project.milestones.find(params[:id])
  end

  def update
    @milestone = @project.milestones.find(params[:id])
    if @milestone.update_attributes(params[:milestone])
      flash[:success] = t(:milestone_updation_success, :scope => [:milestones])
      redirect_to project_milestones_path(@project)
    else
      flash[:error]= t(:milestone_updation_failed, :scope => [:milestones])
      render :action => :edit
    end
  end


  private

  def set_project
    @project = current_user.fetch_projects.find(params[:project_id])
  end

  def set_tab
    @tab = :milestones
  end
end
