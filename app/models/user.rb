class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  has_many :posts
  has_many :subjects
  has_many :roles
  has_many :galleries
  mount_uploader :file, FileUploader

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  def admin?
    !!(roles.find_by_name('Admin'))
  end

  def basic?
    !!(roles.find_by_name('Basic'))
  end

  def editor?
    !!(roles.find_by_name('Editor'))
  end

  def login=(login)
  @login = login
  end

  def login
    @login || self.username || self.email
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end


end
