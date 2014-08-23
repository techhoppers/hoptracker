class Milestone < ActiveRecord::Base
  # Status
  OPEN = "OPEN"
  STARTED = "STARTED"
  COMPLETED = "COMPLETED"


  attr_accessible :name, :start_date, :end_date, :description

  belongs_to :project

  validates :name, :presence => :true

  before_create :set_defaults

  def set_defaults
    self.status = OPEN
  end
  
  
end
