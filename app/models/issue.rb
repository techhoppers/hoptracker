class Issue < ActiveRecord::Base
  # Issue Types

  ISSUE_TYPES = %W{STORY BUG EPIC FEATURE RELEASE}
  PRIORITIES = %W{CRITICAL HIGH MEDIUM LOW}
  STATUSES = {:backlog => 1, :in_development => 2, :ready_for_review => 3,
    :in_review => 4, :review_completed => 5, :ready_for_testing => 6,
    :in_testing => 7, :closed => 8
  }

  belongs_to :project
  belongs_to :milesstone
  
 attr_accessible :title, :description, :acceptence_criteria, :priority,
   :issue_type, :milestone_id, :assigned_to, :project_id, :status

 after_create :set_issue_code

 def set_issue_code
   self.code = "#{self.project.code}-#{self.id}"
   self.save
 end

end
