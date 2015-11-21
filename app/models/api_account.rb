class ApiAccount < ActiveRecord::Base

  before_save :generate_secret_key, on: :create
  validates :access_id, presence: true, uniqueness: true

  rails_admin {
    list {
      field :access_id
    }
  }

  private

  def generate_secret_key
    self.secret_key = ApiAuth.generate_secret_key
  end

end
