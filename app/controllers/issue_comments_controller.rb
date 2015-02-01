class IssueCommentsController < ApplicationController

  before_filter :set_project_and_issue
  before_filter :has_member_rights

  def create
    @issue_comment = @issue.issue_comments.new(params[:issue_comment])
    @issue_comment.user = current_user
    if @issue_comment.save
      flash[:success] = t(:issue_comment_success, :scope => [:issues])
      redirect_to issue_path(@issue.code)
    else
      flash[:error]= t(:issue_comment_failed, :scope => [:issues])
      render :controller => :issues, :action => :show
    end
  end

  def destroy
    @issue_comment = @issue.issue_comments.find(params[:id])
    @issue_comment.destroy
    flash[:success] = t(:comment_deleteion_success, :scope => [:issues])
    redirect_to issue_path(@issue.code)
  end


  private

  def set_project_and_issue
    @project = current_user.fetch_projects.find(params[:project_id])
    @issue = @project.issues.find(params[:issue_id])
  end

end
