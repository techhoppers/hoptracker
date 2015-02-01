class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception,                            :with => :render_500
    rescue_from ActiveRecord::RecordNotFound,         :with => :render_404
    rescue_from ActionController::RoutingError,       :with => :render_404
    rescue_from ActionController::UnknownController,  :with => :render_404
    rescue_from ActionController::UnknownAction,      :with => :render_404
  end

  protected

  def render_404(exception = nil)
    respond_to do |format|
      format.html { render :template => 'shared/error', :layout => 'error',
        :locals => {:status => t(:not_found_title, :scope => [:errors]), :message => t(:not_found, :scope => [:errors]) }}
      format.all { render :nothing => true, :status => 404 }
    end
  end

  def render_500(exception = nil)
    respond_to do |format|
      format.html { render :template => 'shared/error', :layout => 'error',
        :locals => {:status => t(:server_error_title, :scope => [:errors]), :message => t(:server_error, :scope => [:errors]) }}
      format.all { render :nothing => true, :status => 500}
    end
  end

  def render_401
    respond_to do |format|
      format.html { render :template => 'shared/error', :layout => 'error',
        :locals => {:status => t(:unauthorized_title, :scope => [:errors]), :message => t(:unauthorized, :scope => [:errors]) }}
      format.all { render :nothing => true, :status => 401}
    end
  end

  def has_member_rights
    unless current_user.has_member_access(@project)
      render_401
    end
  end

 
  


  
  
end
