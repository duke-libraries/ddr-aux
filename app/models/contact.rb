class Contact < ActiveRecord::Base

  validates :slug, presence: true, uniqueness: true, length: { minimum: 2 }, format: { with: /\A[a-z0-9_\-]+\z/ }
  validates :name, presence: true, uniqueness: true

  rails_admin {
    list {
      field :slug
      field :name
      field :url
    }
  }

end
