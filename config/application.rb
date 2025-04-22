require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NewsPlatform
  class Application < Rails::Application
    # Initialize configuration defaults for Rails version 7.1.
    config.load_defaults 7.1

    # Specify subdirectories in `lib` to ignore during autoloading and eager loading.
    config.autoload_lib(ignore: %w(assets tasks))

    # Middleware configuration
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, key: "_news_platform_session"
    config.middleware.use ActionDispatch::Flash
    config.middleware.use Rack::MethodOverride

    # General application configuration
    # Uncomment and customize the following settings as needed:
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Set to `false` to include full middleware stack and support for views, helpers, and assets.
    config.api_only = false
  end
end
