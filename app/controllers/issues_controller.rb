class IssuesController < ApplicationController
  before_filter :set_project
  before_filter :set_tab
  
  layout "project"

  def index
    @issues = @project.issues
  end

  def new
    @issue = Issue.new
    @project_users = @project.project_users
    @milestones = @project.milestones
  end

  def show
    @issue = @project.issues.find_by_code(params[:code])
  end

  def create
    @issue = @project.issues.new(params[:issue])
    if @issue.save
      flash[:success] = t(:creation_success, :scope => [:issues])
      redirect_to project_issues_path(@project)
    else
      flash[:error]= t(:creation_failed, :scope => [:issues])
      render :action => :new
    end
  end

  private

  def set_project
    unless params[:code].blank?
      project_code = params[:code].split("-")[0]
      @project = current_user.projects.find_by_code(project_code)
    else
      @project = current_user.projects.find(params[:project_id])
    end
    
  end

  def set_tab
    @tab = :issues
  end
  
end
