class ProjectWiki < ActiveRecord::Base

  belongs_to :project
  belongs_to :user
  belongs_to :modified_user, :foreign_key => "modified_user_id", :class_name => "User"
  
  attr_accessible :title, :body, :user_id, :project_id

  validates :title, :presence => true
end
