class User < ActiveRecord::Base

  devise :database_authenticatable, :omniauthable, omniauth_providers: [:shibboleth]

  def self.from_omniauth(auth)
    user = find_by(username: auth.uid) || new(username: auth.uid, password: Devise.friendly_token)
    user.update!(email: auth.info.email,
                 display_name: auth.info.name,
                 first_name: auth.info.first_name,
                 last_name: auth.info.last_name,
                 nickname: auth.info.nickname)
    user
  end

end