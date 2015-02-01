class IssueComment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :issue

  attr_accessible :user_id, :issue_id, :comment
end
