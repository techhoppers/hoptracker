class AdminController < ApplicationController
  before_filter :check_authorization
  
  layout "admin"
  
  def projects
    
  end

  def users
    
  end



  private

  def check_authorization
    unless current_user.is_admin
       render_401
    end
  end
end
