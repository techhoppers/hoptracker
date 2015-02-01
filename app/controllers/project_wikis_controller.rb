class ProjectWikisController < ApplicationController
  before_filter :set_project
  before_filter :has_member_rights

  before_filter :set_tab

  layout "project"

  def index
    @project_wikis = @project.project_wikis
  end

  def new
    @project_wiki = ProjectWiki.new
  end

  def show
    @project_wiki = @project.project_wikis.find(params[:id])
  end

  def create
    @project_wiki = @project.project_wikis.new(params[:project_wiki])
    @project_wiki.user = current_user
    if @project_wiki.save
      flash[:success] = t(:creation_success, :scope => [:project_wikis])
      redirect_to project_project_wikis_path(@project)
    else
      flash[:error]= t(:creation_failed, :scope => [:project_wikis])
      render :action => :new
    end
  end

  def edit
    @project_wiki = @project.project_wikis.find(params[:id])
  end

  def update
    @project_wiki = @project.project_wikis.find(params[:id])
    @project_wiki.modified_user = current_user
    if @project_wiki.update_attributes(params[:project_wiki])
      flash[:success] = t(:wiki_updation_success, :scope => [:project_wikis])
      redirect_to project_project_wiki_path(@project, @project_wiki)
    else
      flash[:error]= t(:wiki_updation_failed, :scope => [:project_wikis])
      render :action => :edit
    end
  end

  def destroy
    @project_wiki = @project.project_wikis.find(params[:id])
    @project_wiki.destroy
    flash[:success] = t(:wiki_deletion_success, :scope => [:project_wikis])
    redirect_to project_project_wikis_path(@project)
  end


  private

  def set_project
    @project = current_user.fetch_projects.find(params[:project_id])
  end

  def set_tab
    @tab = :wiki
  end


end
