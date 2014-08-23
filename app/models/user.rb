class User < ActiveRecord::Base

  has_many :projects
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :city, :state, :country, :avatar

  has_attached_file :avatar, :styles => { :medium => "150x150>", :thumb => "64x64>" }, :default_url => "/assets/no_photo.gif"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :username, :presence=> true, :uniqueness => true
  validates :first_name, :presence=> true
  validates :last_name, :presence=> true
  validates :email, :presence=> true, :uniqueness => true
 

  def name
    [first_name,last_name].join(" ")
  end

  def fetch_projects
    projects.select([:id, :title]).order("CREATED_AT DESC").limit(5)
  end

  def fetch_projects
    projects = Project.where("user_id = #{self.id} or project_users.user_id = #{self.id}").joins(:project_user)
    projects.uniq unless projects.blank?
  end

end
