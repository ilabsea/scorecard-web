# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 7.0.8"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

gem "rack-attack", "~> 6.5.0"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 5.6.7"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem "bootstrap", "~> 4.0"
gem "haml", "~> 5.1.2"
gem "haml-rails", "~> 2.0"
gem "jquery-rails",   "~> 4.4.0"
gem "coffee-rails",   "~> 5.0.0"

gem "devise", "~> 4.8.1"
gem "omniauth-rails_csrf_protection", "~> 1.0.0"
gem "omniauth-google-oauth2", "~> 1.0.0"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

gem "sentry-raven", "~> 3.0.4"
gem "pagy", "~> 5.1.3"
gem "pumi", require: "pumi/rails"
gem "carrierwave", "~> 2.1"
gem "pundit", "~> 2.1.0"
gem "simple_form", "~> 5.0.3"
gem "awesome_nested_set", "~> 3.6.0"
gem "roo", "~> 2.8.3"
gem "active_model_serializers", "~> 0.10.13"

# Write excel
gem "caxlsx"
gem "caxlsx_rails"

gem "bootstrap4-datetime-picker-rails", "~> 0.3.1"

gem "strip_attributes", "~> 1.13.0"
gem "ndjson", "~> 1.0.0"
gem "fog-aws", "~> 3.8.0"
gem "date_validator", "~> 0.10.0"

gem "whenever", "~> 1.0.0", require: false
gem "database_cleaner-active_record", "~> 1.8.0"

gem "wicked_pdf",                 "~> 2.1.0"
gem "wkhtmltopdf-binary",         "~> 0.12.6.5"
gem "telegram-bot", "~> 0.15.3"
gem "pdf-reader", "~> 2.5.0"

gem "mimemagic", "~> 0.3.6"
gem "sidekiq", "~> 7.1.3"
gem "sidekiq-scheduler", "~> 5.0.0"

gem "elasticsearch-model", "~> 7.2.1"
gem "elasticsearch-rails", "~> 7.2.1"

gem "paranoia", "~> 2.6.3"

gem "recaptcha", "~> 5.7.0"
gem "fcm", "~> 1.0.3"
gem "bootstrap-daterangepicker-rails", "~> 3.0.4"

gem "doorkeeper", "~> 5.6.6"
gem "validate_url", "~> 1.0.13"

gem "httparty", "~> 0.21.0"
gem "meta-tags", "~> 2.16.0"
gem "rack-cors", "~> 1.1.1"
gem "best_in_place", git: "https://github.com/mmotherwell/best_in_place"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "psych", "< 4"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails", "~> 6.1.0"
  gem "ffaker", "~> 2.17.0"
  gem "rspec-rails", "~> 4.0.1"
  gem "rubocop-performance", "~> 1.7.1"
  gem "rubocop-rails", "~> 2.22.1"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "rack-mini-profiler"

   # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem "spring"

  gem "annotate"
  gem "bundler-audit", "~>0.8.0"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara"
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "shoulda-matchers", "~> 4.0"
  gem "rspec-sidekiq", "~> 3.1.0"
end
