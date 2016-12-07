class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :subjects
  has_many :roles

  mount_uploader :file, FileUploader

  def admin?
    !!(roles.find_by_name('Admin'))
  end

  def basic?
    !!(roles.find_by_name('Basic'))
  end

  def editor?
    !!(roles.find_by_name('Editor'))
  end

end
