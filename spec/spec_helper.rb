
require 'covered/rspec'
require "bundler/setup"

require 'capybara'

require "falcon/capybara"

require "webdrivers"
require "selenium/webdriver"

require "capybara/rspec"

Capybara.configure do |config|
	# This forces capybara to create a new server instance for each session/spec:
	config.reuse_server = false
	
	config.server = :falcon
	config.javascript_driver = :selenium_chrome_headless
	
	app, _ = Rack::Builder.parse_file(File.join(__dir__, "config.ru"))
	config.app = app
end

RSpec.configure do |config|
	# Enable flags like --only-failures and --next-failure
	config.example_status_persistence_file_path = ".rspec_status"

	config.expect_with :rspec do |c|
		c.syntax = :expect
	end
end
