class ProjectUser < ActiveRecord::Base
  belongs_to :project, :dependent => :destroy
  belongs_to :user, :dependent => :destroy
  belongs_to :project_role, :dependent => :destroy


  attr_accessible :project_role_id, :user_id
end
