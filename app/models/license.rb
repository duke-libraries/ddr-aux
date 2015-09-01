class License < ActiveRecord::Base

  validates :code, presence: true, uniqueness: true
  validates :title, presence: true

end
