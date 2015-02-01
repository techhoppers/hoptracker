class User < ActiveRecord::Base

  has_many :projects
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :city, :state, :country, :avatar, :primary_phone,
                  :home_phone, :work_phone, :fax

  has_attached_file :avatar, :styles => { :medium => "150x150>", :thumb => "64x64>", :small => "24x24>" }, :default_url => "/assets/no_photo.gif"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :username, :presence=> true, :uniqueness => true
  validates :first_name, :presence=> true
  validates :last_name, :presence=> true
  validates :email, :presence=> true, :uniqueness => true
 

  def name
    [first_name,last_name].join(" ")
  end

  def fetch_projects(limit = nil)
    fetch_limit = limit != nil ? limit : 100
    Project.where("project_users.user_id = #{self.id}").joins(:project_users).order("projects.CREATED_AT DESC").limit(fetch_limit)
  end

  def has_admin_access(project)
    is_admin || !project.project_users.find_by_user_id_and_is_admin(self.id, true).blank?
  end

  def has_member_access(project)
    !project.project_users.find_by_user_id(self.id).blank?
  end

end
