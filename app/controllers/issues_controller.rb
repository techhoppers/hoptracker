class IssuesController < ApplicationController
  before_filter :set_project
  before_filter :has_member_rights
  before_filter :set_tab
  
  layout "project"

  def index
    @issues = @project.fetch_issues_summary
  end

  def new
    @issue = Issue.new
    @project_users = @project.project_users
    @milestones = @project.milestones
  end

  def show
    @issue = @project.issues.find_by_code(params[:code])
    @issue_comment = IssueComment.new
    @issue_comments = @issue.issue_comments
  end

  def create
    @issue = @project.issues.new(params[:issue])
    @issue.created_by = current_user.id
    if @issue.save
      flash[:success] = t(:creation_success, :scope => [:issues])
      redirect_to project_issues_path(@project)
    else
      @project_users = @project.project_users
      @milestones = @project.milestones
      flash[:error]= t(:creation_failed, :scope => [:issues])
      render :action => :new
    end
  end

  def edit
    @issue = @project.issues.find(params[:id])
    @project_users = @project.project_users
    @milestones = @project.milestones
  end

  def update
    @issue = @project.issues.find(params[:id])
    if @issue.update_attributes(params[:issue])
      flash[:success] = t(:updation_success, :scope => [:issues])
      redirect_to issue_path(@issue.code)
    else
      flash[:error]= t(:updation_failed, :scope => [:issues])
      render :action => :edit
    end
  end

  private

  def set_project
    unless params[:code].blank?
      project_code = params[:code].split("-")[0]
      @project = current_user.fetch_projects.find_by_code(project_code)
    else
      @project = current_user.fetch_projects.find(params[:project_id])
    end
    
  end

  def set_tab
    @tab = :issues
  end
  
end
