class License < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true

  rails_admin do
    list do
      field :title
      field :url
    end
    show do
      configure :terms do
        formatted_value do
          value ? value.html_safe : value
        end
      end
    end
    update do
      configure :url do
        read_only true
      end
    end
  end

end
