class AdminEntity < ActiveRecord::Base

  validates :slug, uniqueness: true, presence: true
  validates_presence_of :name
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, allow_blank: true

  # Version history
  has_paper_trail

  def to_param
    slug
  end

end
