class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  if Rails.application.config.consider_all_requests_local
    rescue_from Exception,                            :with => :render_error
    rescue_from ActiveRecord::RecordNotFound,         :with => :render_not_found
    rescue_from ActionController::RoutingError,       :with => :render_not_found
    rescue_from ActionController::UnknownController,  :with => :render_not_found
    rescue_from ActionController::UnknownAction,      :with => :render_not_found
  end

  protected

   def render_not_found(exception = nil)
    respond_to do |format|
      format.html { render :template => 'errors/not_found', :layout => 'error', :status => 404 }
      format.all { render :nothing => true, :status => 404 }
    end
  end

  def render_error(exception)
    respond_to do |format|
      format.html { render :template => 'errors/internal_server_error', :layout => 'error', :status => 500 }
      format.all { render :nothing => true, :status => 500}
    end
  end

    def render_401
    respond_to do |format|
      format.html { render :template => 'errors/unauthorized', :layout => 'error', :status => 401 }
      format.all { render :nothing => true, :status => 401}
    end
  end

 
  


  
  
end
