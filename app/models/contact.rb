class Contact < ActiveRecord::Base

  validates :slug, presence: true, uniqueness: true, length: { minimum: 2 }, format: { with: /\A[a-z0-9_\-]+\z/ }
  validates :name, presence: true, uniqueness: true

  rails_admin do
    list do
      field :slug
      field :name
    end
  end

end