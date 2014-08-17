class Project < ActiveRecord::Base

  # Project Status
  STARTED = "STARTED"
  DISABLED = "DISABLED"
  CLOSED = "CLOSED"

  # Associations
  belongs_to :user
  has_many :project_users
  has_many :project_roles

  # Setup accessible (or protected) attributes for your model
  attr_accessible :title, :description, :code, :status

  # Validations
  validates :title, :presence => true
  validates :code, :presence => true, :uniqueness => true

  # Callbacks
  before_create :set_defaults
  after_create :set_project_member # Save the current user as member of project

  def set_defaults
    self.status = STARTED
  end

  def set_project_member
    self.project_users.create(:user => self.user, :is_admin => true )
  end

  def roles_for_in_place
    roles = []
    project_roles.each do |x|
      roles << {:value => x.id, :text => "#{x.role}"}
    end
    roles
  end

end
