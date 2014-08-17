class ProjectUser < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :project_role
end
