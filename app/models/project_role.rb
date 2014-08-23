class ProjectRole < ActiveRecord::Base
  belongs_to :project, :dependent => :destroy
  
  attr_accessible :role

  validates :role, :presence => true

  
end
