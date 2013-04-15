

Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider :twitter, 'FIHhJYMJCnRUwVvvNECZg', 'SMhb5sxQAPezaMyzAcao1NALCLvZ4x0HKarGytgo'
  provider :facebook, '451476331587967', 'fc2e43f04a3adf54c24da857dce45f1c'
  # provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
   provider :google, '859377846247.apps.googleusercontent.com', 'SN41eJUzJmtCacysjSXsfCmg'
end

