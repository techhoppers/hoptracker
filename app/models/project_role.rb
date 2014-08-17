class ProjectRole < ActiveRecord::Base
  belongs_to :project
  
  attr_accessible :role

  validates :role, :presence => true

  
end
