require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SubscriptionSystem
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #

    #load environment variables from custom application.yml file 
    if File.exist?(File.expand_path('application.yml', __dir__))
      config = YAML.safe_load(File.read(File.expand_path('application.yml', __dir__)))
      config.merge! config.fetch(Rails.env, {})
      config.each do |key, value|
        ENV[key] = value.to_s
      end
    end
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
