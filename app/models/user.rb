class User < ActiveRecord::Base

  validates :username, presence: true, uniqueness: true
  devise :database_authenticatable, :omniauthable, omniauth_providers: [:shibboleth]
  before_create :set_generated_password, if: "password.nil?"

  def self.from_omniauth(auth)
    user = find_by(username: auth.uid) || new(username: auth.uid)
    user.update!(email: auth.info.email,
                 display_name: auth.info.name,
                 first_name: auth.info.first_name,
                 last_name: auth.info.last_name,
                 nickname: auth.info.nickname)
    user
  end

  # Return user matching username and API key, or nil if no match.
  # @param username [String]
  # @param api_key [String]
  # @return [User]
  def self.api_authenticate(username, api_key)
    return if api_key.blank?
    find_by(username: username, api_key: api_key)
  end

  def self.generate_password
    Devise.friendly_token
  end

  def self.generate_api_key
    SecureRandom.base64(64)
  end

  rails_admin do
    list do
      field :username
      field :email
      field :first_name
      field :last_name
      field :admin
    end
    visible do
      bindings[:controller].current_user.admin?
    end
  end

  def set_generated_password
    self.password = User.generate_password
  end

  def set_generated_api_key
    self.api_key = User.generate_api_key
  end

end
