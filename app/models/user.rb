class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :city, :state, :country

  attr_accessible :avatar

  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "64x64>" }, :default_url => "/assets/no_photo.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :first_name, :presence=> true
  validates :last_name, :presence=> true
  validates :email, :presence=> true, :uniqueness => true
 

  def name
    [first_name,last_name].join(" ")
  end

end
