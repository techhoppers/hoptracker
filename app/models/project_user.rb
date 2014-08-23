class ProjectUser < ActiveRecord::Base
  belongs_to :project, :dependent => :destroy
  belongs_to :user, :dependent => :destroy
  belongs_to :project_role, :dependent => :destroy
end
