# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CscWeb
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    Raven.configure do |config|
      config.dsn = ENV["SENTRY_DSN"]
    end

    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
    config.i18n.fallbacks = [:en]
    config.i18n.available_locales = [:en, :km]

    # Time zone list: https://api.rubyonrails.org/classes/ActiveSupport/TimeZone.html
    config.time_zone = ENV["TIME_ZONE"] || "Bangkok"
    config.active_record.default_timezone = :local
  end
end
