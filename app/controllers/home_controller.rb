class HomeController < ApplicationController

  def index
    @user_projects = current_user.fetch_projects
  end
end
