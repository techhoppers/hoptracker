class Project < ActiveRecord::Base

  # Project Status
  STARTED = "STARTED"
  DISABLED = "DISABLED"
  CLOSED = "CLOSED"

  # Associations
  belongs_to :user
  has_many :project_users
  has_many :project_roles
  has_many :milestones
  has_many :issues
  has_many :project_wikis

  # Setup accessible (or protected) attributes for your model
  attr_accessible :title, :description, :code, :status

  # Validations
  validates :title, :presence => true
  validates :code, :presence => true, :uniqueness => true

  # Callbacks
  before_create :set_defaults
  after_create :set_project_member # Save the current user as admin of project

  def set_defaults
    self.status = STARTED
  end

  def set_project_member
    role = self.project_roles.create(:role => ProjectRole::ADMINISTRATOR)
    self.project_users.create(:user_id => self.user_id, :project_role_id => role.id, :is_admin => true)
  end

  def roles_for_in_place
    roles = []
    project_roles.each do |x|
      roles << {:value => x.id, :text => "#{x.role}"}
    end
    roles
  end

  def fetch_issues_summary
    issues.select("users.username as username, issues.code as code, issues.title as title, issues.status as status, issues.issue_type as issue_type, issues.assigned_to as assigned_to, issues.priority as priority").joins("LEFT JOIN users on users.id = issues.assigned_to")
  end

end
