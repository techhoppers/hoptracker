class ProjectRole < ActiveRecord::Base
  ADMINISTRATOR = "Administrator"
  belongs_to :project
  attr_accessible :role
  validates :role, :presence => true

  
end
