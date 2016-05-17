class AdminSet < ActiveRecord::Base
  validates :code, presence: true, uniqueness: true,
            length: { minimum: 2 }, format: { with: /\A[a-z0-9_\-]+\z/ }
  validates :title, presence: true, uniqueness: true
end
