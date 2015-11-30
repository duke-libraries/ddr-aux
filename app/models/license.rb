class License < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true

  rails_admin {
    list {
      field :title
      field :url
    }
    show {
      configure :terms do
        formatted_value {
          value ? value.html_safe : value
        }
      end
    }
    update {
      configure :url do
        read_only true
      end
    }
  }

end
