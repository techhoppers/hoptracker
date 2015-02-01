class ProjectUser < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :project_role

  validates :user_id, :uniqueness => {:scope => :project_id}


  attr_accessible :project_role_id, :user_id, :is_admin
end
