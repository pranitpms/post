class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :image, ImageUploader



  devise :database_authenticatable, :recoverable, :registerable,
         :rememberable, :trackable,:validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :username, :remember_me, :gallery_id, :remote_image_url, :image ,:role_name

  belongs_to :gallery

  has_and_belongs_to_many :Roles

  accepts_nested_attributes_for :gallery
  # attr_accessible :title, :body



  ROLES =%w[superadmin admin user]

  def role?(role)
    role_name.include?(role.to_s)
  end

end

