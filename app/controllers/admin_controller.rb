class AdminController < ApplicationController
  before_filter :check_authorization

  def index
    
  end



  private

  def check_authorization
    if current_user.is_admin
       render_401
    end
  end
end
