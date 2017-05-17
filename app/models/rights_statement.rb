class RightsStatement < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  serialize :feature, Array

  # Remove blank value introduced to array by hidden form field
  # http://stackoverflow.com/questions/8929230/

  before_save do |model|
    model.feature.delete_if(&:blank?)
  end

  # Icon selections from CC & RS. Must be array to support e.g., CC-BY-NC-ND.
  # SVG image file would be stored as ddr-public assets
  # and displayed in the UI via css classes.

  # http://rightsstatements.org/en/documentation/assets.html
  # https://creativecommons.org/about/downloads/

  def feature_enum
    [
      'cc-cc',
      'cc-by',
      'cc-nc',
      'cc-nc-eu',
      'cc-nc-jp',
      'cc-nc-sa',
      'cc-nc-nd',
      'cc-pd',
      'cc-zero',
      'cc-share',
      'cc-remix',
      'rs-inc',
      'rs-noc',
      'rs-other'
    ]
  end

  # 
  def reuse_text_enum
    [
      'Free Re-Use',
      'Limited Re-Use',
      'No Re-Use'
    ]
  end

end
