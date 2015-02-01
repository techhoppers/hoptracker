class HomeController < ApplicationController

  def index
    @tab = :home
    @user_projects = current_user.fetch_projects(5)
  end
end
