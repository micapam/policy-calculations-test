ENV['RAILS_ENV'] = 'test'
require './config/environment'
require 'minitest/spec'
require 'database_cleaner'
require 'rspec/expectations'
require 'capybara'
require 'spinach/capybara'
require 'selenium-webdriver'
require 'site_prism'
require 'byebug'

# DB stuff
DatabaseCleaner.strategy = :truncation

# Run settings
Spinach.config.save_and_open_page_on_failure = true

SitePrism.configure do |config|
	config.use_implicit_waits = true
end

# Hooks
Spinach.hooks.before_run do
  DatabaseCleaner.clean
end
