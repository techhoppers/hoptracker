class Issue < ActiveRecord::Base
  # Issue Types

  ISSUE_TYPES = %W{STORY BUG EPIC RELEASE}
  PRIORITIES = %W{CRITICAL HIGH MEDIUM LOW}
  STATUSES = %W{BACKLOG BLOCKED IN_DEVELOPMENT READY_FOR_REVIEW IN_REVIEW
          REVIEW_COMPLETED READY_FOR_TESTING IN_TESTING CLOSED}

  belongs_to :project
  belongs_to :milestone
  belongs_to :assignee, :class_name => "User", :foreign_key => "assigned_to"
  belongs_to :reporter, :class_name => "User", :foreign_key => "created_by"
  has_many :issue_comments

  validates :title, :presence => true
  validates :issue_type, :presence => true
  validates :priority, :presence => true
  
  attr_accessible :title, :description, :acceptence_criteria, :priority,
   :issue_type, :milestone_id, :assigned_to, :project_id, :status, :estimate,
   :percentage_completed

  after_create :set_issue_code
  after_create :set_defaults

  def set_defaults
    self.status = "BACKLOG"
  end

  def set_issue_code
   self.code = "#{self.project.code}-#{self.id}"
   self.save
  end

  def is_closed?
    status == "CLOSED"
  end
  
end
