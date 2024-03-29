class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :authentications

  devise :database_authenticatable, :recoverable, :registerable,
         :rememberable, :trackable,:validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :username, :remember_me, :role_name, :avatar, :remote_avatar_url

  mount_uploader :avatar , AvatarUploader

  has_and_belongs_to_many :Roles

  letsrate_rater



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



def apply_omniauth(omniauth)
  # self.email = omniauth['user_info']['email'] if email.blank?
  authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
end

def password_required?
  (authentications.empty? || !password.blank?) && super
end

end

