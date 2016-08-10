require "duracloud"

Duracloud::Client.configure do |config|
  config.logger = Rails.logger
end
