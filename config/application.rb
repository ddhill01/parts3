require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Parts3
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    
    config.generators do |g|
      g.hidden_namespaces << :test_unit << :erb # Hide unwanted generators
      g.template_engine :slim # Select template engine
      g.helper false # Don't create view helpers
      g.test_framework  :rspec, :view_specs => false
      g.integration_tool :rspec
      g.fixture_replacement :factory_bot # Choose between fixtures and factories
      g.factory_bot dir: 'spec/factories'
      g.javascript_engine :js # Disable coffeescript
      g.scaffold_controller "responders_controller" # from responders gem
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
