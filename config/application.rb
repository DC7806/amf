require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Amf
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Taipei'
    # delay job
    config.active_job.queue_adapter = :delayed_job
    # I18n
    config.i18n.available_locales = %i[en zh-TW zh-CN]
    config.i18n.default_locale = :"zh-TW"
    config.i18n.fallbacks = true
    
  end
end
