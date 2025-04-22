source "https://rubygems.org"

ruby "3.2.2"

# Rails framework
gem "rails", "~> 7.1.0"

# Database
# Use MySQL as the database for Active Record
gem "mysql2", "~> 0.5"

# Web server
# Use the Puma web server for better performance
gem "puma", ">= 5.0"

# Platform-specific dependencies
# Include zoneinfo files for Windows and JRuby platforms
gem "tzinfo-data", platforms: %i[windows jruby]

# Performance
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Admin interface
# Admin interface for Rails applications
gem "rails_admin", "~> 3.3"

# Authentication
# Authentication solution for Rails
gem "devise"

# Pagination
# Pagination library for Rails
gem "kaminari"

# Data generation
# Generate fake data for testing and development
gem "faker"

# Asset pipeline
# Use SassC for compiling Sass stylesheets
gem "sassc-rails"

# Testing framework
# RSpec for testing Rails applications
gem "rspec-rails", "~> 7.1", group: [:development, :test]

# Development and test group
group :development, :test do
  # Debugging tools for Rails applications
  gem "debug", platforms: %i[mri windows]

  # Environment variable management
  # Load environment variables from .env files
  gem "dotenv-rails"

  # FactoryBot for creating test data
  gem "factory_bot_rails"

  # Shoulda Matchers for testing model associations and validations
  gem "shoulda-matchers", "~> 5.0"
end

# Development group
group :development do
  # Uncomment to speed up commands on slow machines or large apps
  # gem "spring"
end

# Test group
group :test do
  # Rails Controller Testing
  # Provides `render_template` and other matchers for controller tests
  gem "rails-controller-testing"

  # Capybara for feature and view testing
  gem 'capybara'
end
