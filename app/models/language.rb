class Language < ActiveRecord::Base
  validates :code, presence: true, uniqueness: true
  validates :label, presence: true
end
