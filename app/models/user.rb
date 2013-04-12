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

letsrate_rater

acts_as_voter

  ROLES =%w[superadmin admin user]

  def role?(role)
    role_name.include?(role.to_s)
  end
def online?
    if current_sign_in_at.present?
      last_sign_out_at.present? ? current_sign_in_at > last_sign_out_at : true
    else
      false
    end
  end
  
end

