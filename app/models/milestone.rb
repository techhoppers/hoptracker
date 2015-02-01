class Milestone < ActiveRecord::Base
  # Status
  STATUSES = %W{OPEN STARTED INACTIVE COMPLETED}

  attr_accessible :name, :start_date, :end_date, :description, :status
  
  belongs_to :project

  validates :name, :presence => :true
  validates :start_date, :presence => true
  validates :end_date, :presence => true

  before_create :set_defaults

  def set_defaults
    self.status = "OPEN"
  end
  
  
end
