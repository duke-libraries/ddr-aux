class License < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true

  rails_admin do
    list do
      field :title
      field :url
    end
    edit do
      configure :url do
        read_only true
      end
    end
  end

end
